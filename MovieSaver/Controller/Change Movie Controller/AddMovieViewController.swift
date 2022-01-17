import UIKit

protocol TransferDataBetweenVCDelegate: AnyObject {
    func transferMovieName(_ name: String)
    func transferMovieRating(_ rating: String)
    func transferMovieDate(_ date: Date)
    func transferMovieYouTube(_ url: URL)
}

final class AddMovieViewController: UIViewController {
    // MARK: - Actions
    // MARK: Private
    @objc private func saveButtonClick() {
        if mainNameLabel.text != "-" && mainDateLabel.text != "-" && mainRatingLabel.text != "-" && mainYoutubeLabel.text != "-" && descriptionTextView.text != "-" && movieImageView.image != UIImage(named: "Rectangle") {
            movieInfo.name = mainNameLabel.text!
            movieInfo.rating = mainRatingLabel.text!
            movieInfo.releaseDate = mainDateLabel.text!
            movieInfo.youtubeLink = URL(string: mainYoutubeLabel.text!)!
            movieInfo.description = descriptionTextView.text!
            movieInfo.imageMovie = movieImageView.image!
            delegate?.transferMovieInfo(movieInfo)
            navigationController?.popViewController(animated: true)
        } else {
            showAllert("Fill in all fields")
        }
    }
    
    @objc private func nameClickButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let fillNameVC = storyboard.instantiateViewController(withIdentifier: "FilmNameViewController") as? FilmNameViewController {
            fillNameVC.delegate = self
            navigationController?.pushViewController(fillNameVC, animated: true)
        } else {
            showAllert("Unknown error")
        }
    }
    @objc private func ratingClickButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let pickerVC = storyboard.instantiateViewController(withIdentifier: "PickerViewController") as? PickerViewController {
            navigationController?.pushViewController(pickerVC, animated: true)
            pickerVC.delegate = self
        } else {
            showAllert("Unknown error")
        }
    }
    
    @objc private func dateClickButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let datePickerVC = storyboard.instantiateViewController(withIdentifier: "DatePickerViewController") as? DatePickerViewController {
            datePickerVC.delegate = self
            navigationController?.pushViewController(datePickerVC, animated: true)
        } else {
            showAllert("Unknown error")
        }
    }
      
    @objc private func youTubeClickButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let youTubeVC = storyboard.instantiateViewController(withIdentifier: "YouTubeLinkViewController") as? YouTubeLinkViewController {
            navigationController?.pushViewController(youTubeVC, animated: true)
            youTubeVC.delegate = self
        } else {
            showAllert("Unknown error")
        }
    }
    
    // MARK: - Properties
    // MARK: Public
    weak var delegate: TransferMovieBetweenVCDelegate?
    // MARK: Private
    private var movieInfo: MovieInfo = MovieInfo()
    private let movieImageView: UIImageView = UIImageView()
    private let infoView: UIView = UIView()
    private let infoMovieStackView: UIStackView = UIStackView()
    
    private let firstStackView: UIStackView = UIStackView()
    private let nameLabel: UILabel = UILabel()
    private let ratingLabel: UILabel = UILabel()
    
    private let secondStackView: UIStackView = UIStackView()
    private let mainNameLabel: UILabel = UILabel()
    private let mainRatingLabel: UILabel = UILabel()
    
    private let thirdStackView: UIStackView = UIStackView()
    private let changeNameButton: UIButton = UIButton()
    private let changeRatingButton: UIButton = UIButton()
    
    private let separatorStackView: UIStackView = UIStackView()
    private let separatorView: UIView = UIView()
    
    private let fouthStackView: UIStackView = UIStackView()
    private let dateLabel: UILabel = UILabel()
    private let youtubeLabel: UILabel = UILabel()
    
    private let fifthStackView: UIStackView = UIStackView()
    private let mainDateLabel: UILabel = UILabel()
    private let mainYoutubeLabel: UILabel = UILabel()
    
    private let sixStackView: UIStackView = UIStackView()
    private let changeDateButton: UIButton = UIButton()
    private let changeYoutubeButton: UIButton = UIButton()
    
    private let descriptionLabel: UILabel = UILabel()
    private let descriptionTextView: UITextView = UITextView()

    //MARK: - LIfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        addSetupsUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        movieImageView.layer.cornerRadius = movieImageView.frame.size.width / 2
        movieImageView.clipsToBounds = true
    }
    
    // MARK: - Constraints
    // MARK: Private
    private func addConstraints() {
        addMovieImageViewConstraint()
        addInfoViewConstraint()
        addInfoMovieStackViewConstraint()
        addDescriptionTextViewConstraint()
        addDescriptionLabelConstarint()
    }
    
    private func addMovieImageViewConstraint() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.bottomAnchor.constraint(equalTo: infoView.topAnchor, constant: -30).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func addInfoViewConstraint() {
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        infoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20).isActive = true
    }
    
    private func addInfoMovieStackViewConstraint() {
        infoMovieStackView.translatesAutoresizingMaskIntoConstraints = false
        infoMovieStackView.topAnchor.constraint(equalTo: infoView.topAnchor).isActive = true
        infoMovieStackView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor).isActive = true
        infoMovieStackView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor).isActive = true
        infoMovieStackView.bottomAnchor.constraint(equalTo: infoView.bottomAnchor).isActive = true
    }
    
    private func addDescriptionTextViewConstraint() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    private func addDescriptionLabelConstarint() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.bottomAnchor.constraint(equalTo: descriptionTextView.topAnchor, constant: -11).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    // MARK: - Setups
    // MARK: Private
    private func addSubviews() {
        view.addSubViews(movieImageView, infoView, descriptionLabel, descriptionTextView)
        infoView.addSubview(infoMovieStackView)
        
        infoMovieStackView.addArrangedSubview(firstStackView)
        firstStackView.addArrangedSubview(nameLabel)
        firstStackView.addArrangedSubview(ratingLabel)
        
        infoMovieStackView.addArrangedSubview(secondStackView)
        secondStackView.addArrangedSubview(mainNameLabel)
        secondStackView.addArrangedSubview(mainRatingLabel)
        
        infoMovieStackView.addArrangedSubview(thirdStackView)
        thirdStackView.addArrangedSubview(changeNameButton)
        thirdStackView.addArrangedSubview(changeRatingButton)
        
        infoMovieStackView.addArrangedSubview(separatorStackView)
        infoMovieStackView.addArrangedSubview(separatorView)
        
        infoMovieStackView.addArrangedSubview(fouthStackView)
        fouthStackView.addArrangedSubview(dateLabel)
        fouthStackView.addArrangedSubview(youtubeLabel)
        
        infoMovieStackView.addArrangedSubview(fifthStackView)
        fifthStackView.addArrangedSubview(mainDateLabel)
        fifthStackView.addArrangedSubview(mainYoutubeLabel)
        
        infoMovieStackView.addArrangedSubview(sixStackView)
        sixStackView.addArrangedSubview(changeDateButton)
        sixStackView.addArrangedSubview(changeYoutubeButton)
    }
    
    private func addSetupsUI() {
        addNavigationControllerUI()
        addInfoViewUI()
        addMovieImageViewUI()
        addInfoMovieStackViewUI()
        
        addFirstStackViewUI()
        addNameLabelUI()
        addRatingLabelUI()
        
        addSecondStackViewUI()
        addMainNameLabelUI()
        addMainRatingLabelUI()
        
        addThirdStackViewUI()
        addChangeNameButtonUI()
        addChangeRatingButtonUI()
        
        addSeparatorStackViewUI()
        
        addFouthStackViewUI()
        addDateLabelUI()
        addYoutubeLabelUI()
        
        addFifthStackViewUI()
        addMainDateLabelUI()
        addMainYoutubeLabelUI()
        
        addSixStackViewUI()
        addChangeDateButtonUI()
        addChangeYoutubeButtonUI()
        
        addDescriprionLabelUI()
        addDescriptionTextFieldUI()
    }
    
    private func addMovieImageViewUI() {
        movieImageView.image = UIImage(named: "Rectangle")
        let tap = UITapGestureRecognizer(target: self, action: #selector(imagePickerBtnAction))
        movieImageView.isUserInteractionEnabled = true
        movieImageView.addGestureRecognizer(tap)
    }
    
    private func addInfoViewUI() {
        infoView.backgroundColor = .white
        infoView.layer.cornerRadius = 10
    }
    
    private func addInfoMovieStackViewUI() {
        infoMovieStackView.axis = .vertical
        infoMovieStackView.distribution = .fillEqually
        infoMovieStackView.alignment = .fill
    }
    
    private func addFirstStackViewUI() {
        firstStackView.axis = .horizontal
        firstStackView.alignment = .fill
        firstStackView.distribution = .fillEqually
    }
    
    private func addSecondStackViewUI() {
        secondStackView.axis = .horizontal
        secondStackView.distribution = .fillEqually
        secondStackView.alignment = .fill
    }
    
    private func addThirdStackViewUI() {
        thirdStackView.axis = .horizontal
        thirdStackView.distribution = .fillEqually
        thirdStackView.alignment = .fill
    }
    
    private func addSeparatorStackViewUI() {
        separatorStackView.axis = .horizontal
        separatorStackView.distribution = .fillEqually
        separatorStackView.alignment = .fill
    }
    
    private func addFouthStackViewUI() {
        fouthStackView.axis = .horizontal
        fouthStackView.distribution = .fillEqually
        fouthStackView.alignment = .fill
    }
    
    private func addFifthStackViewUI() {
        fifthStackView.axis = .horizontal
        fifthStackView.distribution = .fillEqually
        fifthStackView.alignment = .fill
    }
    
    private func addSixStackViewUI() {
        sixStackView.axis = .horizontal
        sixStackView.distribution = .fillEqually
        sixStackView.alignment = .fill
    }
    
    private func addNameLabelUI() {
        nameLabel.text = "Name"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        nameLabel.textAlignment = .center
    }
    
    private func addRatingLabelUI() {
        ratingLabel.text = "Your Rating"
        ratingLabel.textColor = .black
        ratingLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        ratingLabel.textAlignment = .center
    }
    
    private func addMainNameLabelUI() {
        mainNameLabel.text = "-"
        mainNameLabel.textColor = .black
        mainNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        mainNameLabel.textAlignment = .center
    }
    
    private func addMainRatingLabelUI() {
        mainRatingLabel.text = "-"
        mainRatingLabel.textColor = .black
        mainRatingLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        mainRatingLabel.textAlignment = .center
    }
    
    private func addChangeNameButtonUI() {
        changeNameButton.setTitle("Change", for: .normal)
        changeNameButton.backgroundColor = .white
        changeNameButton.setTitleColor(.systemBlue, for: .normal)
        changeNameButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        changeNameButton.addTarget(self, action: #selector(nameClickButton), for: .touchUpInside)
    }
    
    private func addChangeRatingButtonUI() {
        changeRatingButton.setTitle("Change", for: .normal)
        changeRatingButton.backgroundColor = .white
        changeRatingButton.setTitleColor(.systemBlue, for: .normal)
        changeRatingButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        changeRatingButton.addTarget(self, action: #selector(ratingClickButton), for: .touchUpInside)
    }

    private func addDateLabelUI() {
        dateLabel.text = "Release Date"
        dateLabel.textColor = .black
        dateLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        dateLabel.textAlignment = .center
    }
    
    private func addYoutubeLabelUI() {
        youtubeLabel.text = "YouTube Link"
        youtubeLabel.textColor = .black
        youtubeLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        youtubeLabel.textAlignment = .center
    }
    
    private func addMainDateLabelUI() {
        mainDateLabel.text = "-"
        mainDateLabel.textColor = .black
        mainDateLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        mainDateLabel.textAlignment = .center
    }
    
    private func addMainYoutubeLabelUI() {
        mainYoutubeLabel.text = "-"
        mainYoutubeLabel.textColor = .black
        mainYoutubeLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        mainYoutubeLabel.textAlignment = .center
    }
    
    private func addChangeDateButtonUI() {
        changeDateButton.setTitle("Change", for: .normal)
        changeDateButton.backgroundColor = .white
        changeDateButton.setTitleColor(.systemBlue, for: .normal)
        changeDateButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        changeDateButton.addTarget(self, action: #selector(dateClickButton), for: .touchUpInside)
    }
    
    private func addChangeYoutubeButtonUI() {
        changeYoutubeButton.setTitle("Change", for: .normal)
        changeYoutubeButton.backgroundColor = .white
        changeYoutubeButton.setTitleColor(.systemBlue, for: .normal)
        changeYoutubeButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        changeYoutubeButton.addTarget(self, action: #selector(youTubeClickButton), for: .touchUpInside)
    }
    
    private func addDescriprionLabelUI() {
        descriptionLabel.text = "Description"
        descriptionLabel.textColor = .black
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    }
    
    private func addDescriptionTextFieldUI() {
        descriptionTextView.layer.borderColor = UIColor.black.cgColor
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor.opaqueSeparator.cgColor
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.textColor = .black
        descriptionTextView.font = UIFont.systemFont(ofSize: 18, weight: .light)
    }
    
    private func addNavigationControllerUI() {
        title = "Add new"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonClick))
    }
    
    // MARK: - Helpers
    // MARK: Private
    private func showAllert(_ msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension AddMovieViewController: TransferDataBetweenVCDelegate {
    func transferMovieRating(_ rating: String) {
        mainRatingLabel.text = rating
    }
    
    func transferMovieDate(_ date: Date) {
        let dateformatter = DateFormatter()
        //dateformatter.dateFormat = "dd MMMM yyyy"
        dateformatter.dateFormat = "yyyy"
        mainDateLabel.text = dateformatter.string(from: date)
        
    }
    
    func transferMovieYouTube(_ url: URL) {
        mainYoutubeLabel.text = url.absoluteString
    }
    
    func transferMovieName(_ name: String) {
        mainNameLabel.text = name
    }
}

extension AddMovieViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @objc private func imagePickerBtnAction() {
            let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                self.openCamera()
            }))

            alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
                self.openGallery()
            }))

            alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))

            self.present(alert, animated: true, completion: nil)
        }
    
    private func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.editedImage] as? UIImage {
            movieImageView.image = image
        }
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            movieImageView.image = image
        }
    }
}
