import UIKit

final class MovieInfoTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    // MARK: Public
    public var movieImageView: UIImageView = UIImageView()
    public var nameMovieLabel: UILabel = UILabel()
    public var ratingMovieLabel: UILabel = UILabel()
    
    // MARK: Private
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
    
    // MARK: - Constraints
    // MARK: Private
    private func addConstraints() {
        addMainViewConstarint()
        addMainStackViewConstraint()
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
        addMainViewUI()
        addMovieImageViewUI()
        addMainStackViewUI()
        addInfoMovieStackViewUI()
        addNameMovieLabelUI()
        addRatingMovieLabelUI()
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
        infoMovieStackView.distribution = .fillEqually
    }
    
    private func addNameMovieLabelUI() {
        nameMovieLabel.textAlignment = .center
        nameMovieLabel.textColor = .black
        nameMovieLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        nameMovieLabel.numberOfLines = 3
    }
    
    private func addRatingMovieLabelUI() {
        ratingMovieLabel.text = "8.9/10"
        ratingMovieLabel.textAlignment = .center
        ratingMovieLabel.textColor = .black
        ratingMovieLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    }
}
