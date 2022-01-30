import UIKit

protocol TransferMovieBetweenVCDelegate: AnyObject {
    func transferMovieInfo(_ movieInfo: MovieInfo)
}

final class ViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: Public
    public let mainTableView: UITableView =  UITableView()
    // MARK: Private
    private var moviesInfo: [MovieInfo] = []
    //MARK: - LIfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        addSetupsTableView()
        addConstraints()
        addNavigationControllerUI()
        mainTableView.register(MovieInfoTableViewCell.self, forCellReuseIdentifier: "MovieInfoTableViewCell")
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
    
    private func addSetupsTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.separatorStyle = .none
        mainTableView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    }
    
    private func addNavigationControllerUI() {
        title = "My Movie List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewButtonClick))
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesInfo.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 212
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = mainTableView.dequeueReusableCell(withIdentifier: "MovieInfoTableViewCell", for: indexPath) as? MovieInfoTableViewCell {
            let movie = moviesInfo[indexPath.row]
            cell.setInfoMovie(NameMovie: movie.name, RatingMovie: ratingMovieInfo(indexPath), ImageMovie: movie.imageMovie)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailScreenVC = storyboard.instantiateViewController(withIdentifier: "DetailScreenViewController") as? DetailScreenViewController {
            detailScreenVC.movieInfo = moviesInfo[indexPath.item]
            navigationController?.pushViewController(detailScreenVC, animated: true)
        }
    }
    
    // MARK: - Actions
    // MARK: Private
    @objc private func addNewButtonClick() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let addNewVC = storyboard.instantiateViewController(withIdentifier: "AddMovieViewController") as? AddMovieViewController {
            addNewVC.delegate = self
            navigationController?.pushViewController(addNewVC, animated: true)
        }
    }
    
    // MARK: - Helpers
    // MARK: Private
    private func ratingMovieInfo(_ indexPath: IndexPath) -> NSMutableAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)]
        let secondAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .light)]
        let firstString = NSMutableAttributedString(string: "\(moviesInfo[indexPath.row].rating)", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "/10", attributes: secondAttributes)
        firstString.append(secondString)
        return firstString
    }
}

extension ViewController: TransferMovieBetweenVCDelegate {
    func transferMovieInfo(_ movieInfo: MovieInfo) {
        moviesInfo.append(movieInfo)
        mainTableView.reloadData()
    }
}

