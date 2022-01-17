import UIKit
import WebKit

final class DetailScreenViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: Public
    public var movieInfo: MovieInfo = MovieInfo()
    // MARK: Private
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
        movieImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    private func addMainViewConstraint() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: -90).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func addNameMovieLabelConstraint() {
        nameMovieLabel.translatesAutoresizingMaskIntoConstraints = false
        nameMovieLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
        nameMovieLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 19).isActive = true
        nameMovieLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -19).isActive = true
        nameMovieLabel.heightAnchor.constraint(equalToConstant: 58).isActive = true
    }
    
    private func addRatingAndYearLabelConstraint() {
        ratingAndYearLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingAndYearLabel.topAnchor.constraint(equalTo: nameMovieLabel.bottomAnchor, constant: 10).isActive = true
        ratingAndYearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        ratingAndYearLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        ratingAndYearLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    private func addDescriptionTextViewConstraint() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: ratingAndYearLabel.bottomAnchor, constant: 13).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }
    
    private func addTrailerWebViewConstraint() {
        trailerWebView.translatesAutoresizingMaskIntoConstraints = false
        trailerWebView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 13).isActive = true
        trailerWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        trailerWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        trailerWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
    
    // MARK: - Setups
    // MARK: Private
    private func addSubviews() {
        view.addSubViews(movieImage, mainView)
        mainView.addSubViews(nameMovieLabel, ratingAndYearLabel, descriptionTextView, trailerWebView)
    }
    
    private func addSetupsUI() {
        addMainViewUI()
        addNameMovieLabelUI()
        addRatingAndYearLabelUI()
        addDescriptionTextViewUI()
    }
    
    private func addMainViewUI() {
        mainView.layer.cornerRadius = 16
        mainView.backgroundColor = .white
    }
    
    private func addNameMovieLabelUI() {
        nameMovieLabel.numberOfLines = 2
        nameMovieLabel.textColor = .black
        nameMovieLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
    }
    
    private func addRatingAndYearLabelUI() {
        ratingAndYearLabel.textColor = .black
    }
    
    private func addDescriptionTextViewUI() {
        descriptionTextView.textColor = .black
        descriptionTextView.font = UIFont.systemFont(ofSize: 15, weight: .light)
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.layer.borderColor = UIColor.opaqueSeparator.cgColor
        descriptionTextView.layer.borderWidth = 1
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
        
        let firstAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .bold)]
        let secondAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .light)]
        let thirdAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .light)]

        let firstString = NSMutableAttributedString(string: "  \(movieInfo.rating)", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "/10", attributes: secondAttributes)
        let thirdString = NSAttributedString(string: " \(movieInfo.releaseDate)", attributes: thirdAttributes)
        attachmentString.append(firstString)
        attachmentString.append(secondString)
        attachmentString.append(thirdString)
        ratingAndYearLabel.attributedText = attachmentString
    }
}
