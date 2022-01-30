import UIKit

final class MovieInfoTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    // MARK: Private
    private var movieImageView: UIImageView = UIImageView()
    private var nameMovieLabel: UILabel = UILabel()
    private var ratingMovieLabel: UILabel = UILabel()
    private let mainView: UIView = UIView()
    private let infoMovieStackView: UIStackView = UIStackView()
    private let mainStackView: UIStackView = UIStackView()
    
    //MARK: - LIfecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addAllSubviews()
        addConstraints()
        addSetupsUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    func setInfoMovie(NameMovie name: String, RatingMovie rating: NSAttributedString, ImageMovie image: UIImage) {
        nameMovieLabel.text = name
        ratingMovieLabel.attributedText = rating
        movieImageView.image = image
    }
    
    // MARK: - Constraints
    // MARK: Private
    private func addConstraints() {
        addMainViewConstarint()
        addMainStackViewConstraint()
        addNameMovieLabelConstraint()
    }
    
    private func addMainViewConstarint() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func addMainStackViewConstraint() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
    }
    
    private func addNameMovieLabelConstraint() {
        nameMovieLabel.translatesAutoresizingMaskIntoConstraints = false
        nameMovieLabel.heightAnchor.constraint(equalTo: infoMovieStackView.heightAnchor, multiplier: 0.6).isActive = true
    }
    
    // MARK: - Setups
    // MARK: Private
    private func addAllSubviews() {
        contentView.addSubview(mainView)
        mainView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(movieImageView)
        mainStackView.addArrangedSubview(infoMovieStackView)
        infoMovieStackView.addArrangedSubview(nameMovieLabel)
        infoMovieStackView.addArrangedSubview(ratingMovieLabel)
    }
    
    private func addSetupsUI() {
        addContentViewUI()
        addMainViewUI()
        addMovieImageViewUI()
        addMainStackViewUI()
        addInfoMovieStackViewUI()
        addNameMovieLabelUI()
        addRatingMovieLabelUI()
    }
    
    private func addContentViewUI() {
        contentView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    }
    
    private func addMovieImageViewUI() {
        movieImageView.layer.cornerRadius = 10
        movieImageView.clipsToBounds = true
    }
    
    private func addMainViewUI() {
        mainView.backgroundColor = .white
        mainView.layer.cornerRadius = 10
        mainView.addShadow()
    }
    
    private func addMainStackViewUI() {
        mainStackView.axis = .horizontal
        mainStackView.alignment = .fill
        mainStackView.distribution = .fillEqually
        mainStackView.layer.cornerRadius = 10
    }
    
    private func addInfoMovieStackViewUI() {
        infoMovieStackView.axis = .vertical
        infoMovieStackView.alignment = .center
        infoMovieStackView.distribution = .fillProportionally
    }
    
    private func addNameMovieLabelUI() {
        nameMovieLabel.textAlignment = .center
        nameMovieLabel.textColor = .black
        nameMovieLabel.font = .manrope(18, .medium)
        nameMovieLabel.numberOfLines = 3
    }
    
    private func addRatingMovieLabelUI() {
        ratingMovieLabel.textAlignment = .center
        ratingMovieLabel.textColor = .black
        ratingMovieLabel.font = .manrope(18, .medium)
    }
}
