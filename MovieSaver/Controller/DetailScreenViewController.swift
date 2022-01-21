import UIKit
import WebKit

final class DetailScreenViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: Public
    public var movieInfo: MovieInfo = MovieInfo()
    // MARK: Private
    private let scrollView: UIScrollView = UIScrollView()
    private let viewForScrollView: UIView = UIView()
    private let movieImage: UIImageView = UIImageView()
    private let mainView: UIView = UIView()
    private let nameMovieLabel: UILabel = UILabel()
    private let ratingAndYearLabel: UILabel = UILabel()
    private let descriptionTextView: UITextView = UITextView()
    private let trailerWebView: WKWebView = WKWebView()
    
    //MARK: - LIfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        addSetupsUI()
        addInfoMovie()
    }
    
    // MARK: - Constraints
    // MARK: Private
    private func addConstraints() {
        addMovieImageConstraint()
        addMainViewConstraint()
        addScrollViewConstraint()
        addViewForScrollViewConstraint()
        addNameMovieLabelConstraint()
        addRatingAndYearLabelConstraint()
        addDescriptionTextViewConstraint()
        addTrailerWebViewConstraint()
    }
    
    private func addMovieImageConstraint() {
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        movieImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        movieImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: 286).isActive = true
    }
    
    private func addMainViewConstraint() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: -90).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func addScrollViewConstraint() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
    }
    
    private func addViewForScrollViewConstraint() {
        viewForScrollView.translatesAutoresizingMaskIntoConstraints = false
        viewForScrollView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        viewForScrollView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        viewForScrollView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        viewForScrollView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        viewForScrollView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        viewForScrollView.heightAnchor.constraint(equalToConstant: 630).isActive = true
    }
    
    private func addNameMovieLabelConstraint() {
        nameMovieLabel.translatesAutoresizingMaskIntoConstraints = false
        nameMovieLabel.topAnchor.constraint(equalTo: viewForScrollView.topAnchor, constant: 15).isActive = true
        nameMovieLabel.leadingAnchor.constraint(equalTo: viewForScrollView.leadingAnchor, constant: 19).isActive = true
        nameMovieLabel.trailingAnchor.constraint(equalTo: viewForScrollView.trailingAnchor, constant: -19).isActive = true
        nameMovieLabel.heightAnchor.constraint(equalToConstant: 58).isActive = true
    }
    
    private func addRatingAndYearLabelConstraint() {
        ratingAndYearLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingAndYearLabel.topAnchor.constraint(equalTo: nameMovieLabel.bottomAnchor, constant: 10).isActive = true
        ratingAndYearLabel.leadingAnchor.constraint(equalTo: viewForScrollView.leadingAnchor, constant: 19).isActive = true
        ratingAndYearLabel.trailingAnchor.constraint(equalTo: viewForScrollView.trailingAnchor, constant: -19).isActive = true
        ratingAndYearLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    private func addDescriptionTextViewConstraint() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: ratingAndYearLabel.bottomAnchor, constant: 13).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: viewForScrollView.trailingAnchor, constant: -19).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: viewForScrollView.leadingAnchor, constant: 19).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 138).isActive = true
    }
    
    private func addTrailerWebViewConstraint() {
        trailerWebView.translatesAutoresizingMaskIntoConstraints = false
        trailerWebView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 24).isActive = true
        trailerWebView.leadingAnchor.constraint(equalTo: viewForScrollView.leadingAnchor, constant: 19).isActive = true
        trailerWebView.trailingAnchor.constraint(equalTo: viewForScrollView.trailingAnchor, constant: -19).isActive = true
        trailerWebView.bottomAnchor.constraint(equalTo: viewForScrollView.bottomAnchor, constant: -30).isActive = true
    }
    
    // MARK: - Setups
    // MARK: Private
    private func addSubviews() {
        view.addSubViews(movieImage, mainView)
        mainView.addSubview(scrollView)
        scrollView.addSubview(viewForScrollView)
        viewForScrollView.addSubViews(nameMovieLabel, ratingAndYearLabel, descriptionTextView, trailerWebView)
    }
    
    private func addSetupsUI() {
        addMainViewUI()
        addMovieImageUI()
        addNameMovieLabelUI()
        addRatingAndYearLabelUI()
        addDescriptionTextViewUI()
    }
    
    private func addMovieImageUI() {
        movieImage.contentMode = .scaleAspectFill
    }
    
    private func addMainViewUI() {
        mainView.layer.cornerRadius = 16
        mainView.backgroundColor = .white
    }
    
    private func addNameMovieLabelUI() {
        nameMovieLabel.numberOfLines = 2
        nameMovieLabel.textColor = .black
        nameMovieLabel.font = .manrope(24, .bold)
    }
    
    private func addRatingAndYearLabelUI() {
        ratingAndYearLabel.textColor = .black
    }
    
    private func addDescriptionTextViewUI() {
        descriptionTextView.textColor = .black
        descriptionTextView.font = .manrope(15, .regular)
        descriptionTextView.isEditable = false
    }
    
    // MARK: - Helpers
    // MARK: Private
    private func addInfoMovie() {
        movieImage.image = movieInfo.imageMovie
        nameMovieLabel.text = movieInfo.name
        descriptionTextView.text = movieInfo.description
        addRatingAndYearLabelInfo()
        trailerWebView.load(URLRequest(url: movieInfo.youtubeLink))
    }
    
    private func addRatingAndYearLabelInfo() {
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "Star.png")
        let attachmentString = NSMutableAttributedString(attachment: attachment)
        
        let firstAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.manrope(14, .bold)]
        let secondAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .light)]
        let thirdAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1), NSAttributedString.Key.font: UIFont.manrope(14, .light)]

        let firstString = NSMutableAttributedString(string: "  \(movieInfo.rating)", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "/10", attributes: secondAttributes)
        let thirdString = NSAttributedString(string: " \(movieInfo.releaseDate)", attributes: thirdAttributes)
        attachmentString.append(firstString)
        attachmentString.append(secondString)
        attachmentString.append(thirdString)
        ratingAndYearLabel.attributedText = attachmentString
    }
}
