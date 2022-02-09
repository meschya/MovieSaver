import CoreData
import UIKit

final class ViewController: UIViewController, NSFetchedResultsControllerDelegate {
    // MARK: - Properties

    // MARK: Private

    private let mainTableView: UITableView = .init()
    private var searchController: UISearchController = .init()
    private var moviesInfo: [MovieMO] = []
    private var searchResults: [MovieMO] = []
    private var fetchResultController: NSFetchedResultsController<MovieMO>!

    // MARK: - LIfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        sleep(1)
        addSubViews()
        addSetups()
        addConstraints()
        addNavigationControllerUI()
        mainTableView.register(MovieInfoTableViewCell.self, forCellReuseIdentifier: MovieInfoTableViewCell.identifier)
        coreDataSetups()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainTableView.reloadData()
    }

    // MARK: - CoreData

    private func coreDataSetups() {
        let fetchRequest: NSFetchRequest<MovieMO> = MovieMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]

        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            fetchResultController = NSFetchedResultsController(
                fetchRequest: fetchRequest,
                managedObjectContext: context,
                sectionNameKeyPath: nil,
                cacheName: nil
            )
            fetchResultController.delegate = self
            do {
                try fetchResultController.performFetch()
                if let fetchedObjects = fetchResultController.fetchedObjects {
                    moviesInfo = fetchedObjects
                }
            } catch {
                print(error)
            }
        }
    }

    // MARK: - Constraints

    // MARK: Private

    private func addConstraints() {
        addTableViewConstraints()
    }

    private func addTableViewConstraints() {
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    // MARK: - Setups

    // MARK: Private

    private func addSubViews() {
        view.addSubview(mainTableView)
    }

    private func addSetups() {
        addSetupsTableView()
        addSetupsSerchController()
    }

    private func addSetupsTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.separatorStyle = .none
        mainTableView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    }

    private func addSetupsSerchController() {
        searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search movies..."
        searchController.searchBar.barTintColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    }

    private func addNavigationControllerUI() {
        title = "My Movie List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(addNewButtonClick)
        )
    }

    // MARK: - Actions

    // MARK: Private

    @objc private func addNewButtonClick() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let addNewVC = storyboard.instantiateViewController(withIdentifier: AddMovieViewController.identifier) as? AddMovieViewController {
            navigationController?.pushViewController(addNewVC, animated: true)
        }
    }

    // MARK: - Helpers

    // MARK: Private

    private func ratingMovieInfo(_ indexPath: IndexPath) -> NSMutableAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        let secondAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .light)
        ]
        let firstString = NSMutableAttributedString(
            string: "\(moviesInfo[indexPath.row].rating!)",
            attributes: firstAttributes
        )
        let secondString = NSAttributedString(
            string: "/10",
            attributes: secondAttributes
        )
        firstString.append(secondString)
        return firstString
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return searchResults.count
        } else {
            return moviesInfo.count
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 212
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = mainTableView.dequeueReusableCell(withIdentifier: MovieInfoTableViewCell.identifier, for: indexPath) as? MovieInfoTableViewCell {
            let movie = (searchController.isActive) ? searchResults[indexPath.row] : moviesInfo[indexPath.row]
            cell.setInfoMovie(
                NameMovie: movie.name!,
                RatingMovie: ratingMovieInfo(indexPath),
                ImageMovie: UIImage(data: movie.imageMovie! as Data)!
            )
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailScreenVC = storyboard.instantiateViewController(withIdentifier: DetailScreenViewController.identifier) as? DetailScreenViewController {
            detailScreenVC.movieInfo = moviesInfo[indexPath.item]
            navigationController?.pushViewController(detailScreenVC, animated: true)
        }
    }

    // MARK: Fetch request methods

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        mainTableView.beginUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath {
                mainTableView.insertRows(at: [newIndexPath], with: .fade)
            }
        case .delete:
            if let indexPath = indexPath {
                mainTableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .update:
            if let indexPath = indexPath {
                mainTableView.reloadRows(at: [indexPath], with: .fade)
            }
        default:
            mainTableView.reloadData()
        }

        if let fetchedObjects = controller.fetchedObjects {
            moviesInfo = fetchedObjects as! [MovieMO]
        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        mainTableView.endUpdates()
    }

    // MARK: Add Delete button to TableView

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else { return }
        let context = appDelegate.persistentContainer.viewContext
        let movieDelete = fetchResultController.object(at: indexPath)
        if editingStyle == .delete {
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            context.delete(movieDelete)
            appDelegate.saveContext()
            tableView.endUpdates()
        }
    }
}

extension ViewController: UISearchResultsUpdating {
    func filterContent(for SearchText: String) {
        searchResults = moviesInfo.filter { movie -> Bool in
            if let name = movie.name {
                let isMatch = name.localizedCaseInsensitiveContains(SearchText)
                return isMatch
            }

            return false
        }
    }

    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            mainTableView.reloadData()
        }
    }
}
