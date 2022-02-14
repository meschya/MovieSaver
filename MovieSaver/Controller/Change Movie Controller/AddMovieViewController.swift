import CoreData
import UIKit

final class AddMovieViewController: UIViewController {
    // MARK: - Identifier

    static let identifier = "AddMovieViewController"

    // MARK: - Properties

    // MARK: Private

    private var movieInfo: MovieMO = .init()
    private var pickedImage: UIImage?
    private let movieImageView: UIImageView = .init()
    private let scrollView: UIScrollView = .init()
    private let mainView: UIView = .init()
    private let infoView: UIView = .init()
    private let infoMovieStackView: UIStackView = .init()
    private let firstStackView: UIStackView = .init()
    private let nameLabel: UILabel = .init()
    private let ratingLabel: UILabel = .init()
    private let secondStackView: UIStackView = .init()
    private let mainNameLabel: UILabel = .init()
    private let mainRatingLabel: UILabel = .init()
    private let thirdStackView: UIStackView = .init()
    private let changeNameButton: UIButton = .init()
    private let changeRatingButton: UIButton = .init()
    private let separatorStackView: UIStackView = .init()
    private let separatorView: UIView = .init()
    private let fouthStackView: UIStackView = .init()
    private let dateLabel: UILabel = .init()
    private let youtubeLabel: UILabel = .init()
    private let fifthStackView: UIStackView = .init()
    private let mainDateLabel: UILabel = .init()
    private let mainYoutubeLabel: UILabel = .init()
    private let sixStackView: UIStackView = .init()
    private let changeDateButton: UIButton = .init()
    private let changeYoutubeButton: UIButton = .init()
    private let descriptionLabel: UILabel = .init()
    private let descriptionTextView: UITextView = .init()

    // MARK: - LIfecycle

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

    // MARK: - Data

    private func saveMovie(_ name: String, _ rating: String, _ releaseDate: String, _ description: String, _ youtubeLink: String, _ image: UIImage) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            movieInfo = MovieMO(context: appDelegate.persistentContainer.viewContext)
            movieInfo.name = name
            movieInfo.rating = rating
            movieInfo.releaseDate = releaseDate
            movieInfo.descriptin = description
            movieInfo.youtubeLink = URL(string: youtubeLink)!
            movieInfo.imageMovie = image.pngData()
            appDelegate.saveContext()
        }
    }

    // MARK: - Constraints

    // MARK: Private

    private func addConstraints() {
        addScrollViewConstraint()
        addMainViewConstraint()
        addMovieImageViewConstraint()
        addInfoViewConstraint()
        addInfoMovieStackViewConstraint()
        addDescriptionTextViewConstraint()
        addDescriptionLabelConstarint()
    }

    private func addScrollViewConstraint() {
        scrollView.frame = view.bounds
    }

    private func addMainViewConstraint() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 730).isActive = true
    }

    private func addMovieImageViewConstraint() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 35).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    private func addInfoViewConstraint() {
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        infoView.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 32).isActive = true
        infoView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 32).isActive = true
        infoView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -32).isActive = true
    }

    private func addInfoMovieStackViewConstraint() {
        infoMovieStackView.translatesAutoresizingMaskIntoConstraints = false
        infoMovieStackView.topAnchor.constraint(equalTo: infoView.topAnchor).isActive = true
        infoMovieStackView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor).isActive = true
        infoMovieStackView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor).isActive = true
        infoMovieStackView.bottomAnchor.constraint(equalTo: infoView.bottomAnchor).isActive = true
    }

    private func addDescriptionLabelConstarint() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 36).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 32).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -32).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func addDescriptionTextViewConstraint() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 11).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 32).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -32).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20).isActive = true
    }

    // MARK: - Setups

    // MARK: Private

    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubViews(mainView)
        mainView.addSubViews(movieImageView, infoView, descriptionLabel, descriptionTextView)
        infoView.addSubview(infoMovieStackView)

        // Add for first StackView elements

        infoMovieStackView.addArrangedSubview(firstStackView)
        firstStackView.addArrangedSubview(nameLabel)
        firstStackView.addArrangedSubview(ratingLabel)

        // Add for second StackView elements

        infoMovieStackView.addArrangedSubview(secondStackView)
        secondStackView.addArrangedSubview(mainNameLabel)
        secondStackView.addArrangedSubview(mainRatingLabel)

        // Add for third StackView elements

        infoMovieStackView.addArrangedSubview(thirdStackView)
        thirdStackView.addArrangedSubview(changeNameButton)
        thirdStackView.addArrangedSubview(changeRatingButton)

        // Add separator

        infoMovieStackView.addArrangedSubview(separatorStackView)
        infoMovieStackView.addArrangedSubview(separatorView)

        // Add for fouth StackView elements

        infoMovieStackView.addArrangedSubview(fouthStackView)
        fouthStackView.addArrangedSubview(dateLabel)
        fouthStackView.addArrangedSubview(youtubeLabel)

        // Add for fifth StackView elements

        infoMovieStackView.addArrangedSubview(fifthStackView)
        fifthStackView.addArrangedSubview(mainDateLabel)
        fifthStackView.addArrangedSubview(mainYoutubeLabel)

        // Add for six StackView elements

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
        movieImageView.contentMode = .scaleAspectFill
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
        nameLabel.font = .manrope(18, .medium)
        nameLabel.textAlignment = .center
    }

    private func addRatingLabelUI() {
        ratingLabel.text = "Your Rating"
        ratingLabel.textColor = .black
        ratingLabel.font = .manrope(18, .medium)
        ratingLabel.textAlignment = .center
    }

    private func addMainNameLabelUI() {
        mainNameLabel.text = "-"
        mainNameLabel.textColor = .black
        mainNameLabel.font = .manrope(18, .medium)
        mainNameLabel.textAlignment = .center
    }

    private func addMainRatingLabelUI() {
        mainRatingLabel.text = "-"
        mainRatingLabel.textColor = .black
        mainRatingLabel.font = .manrope(18, .medium)
        mainRatingLabel.textAlignment = .center
    }

    private func addChangeNameButtonUI() {
        changeNameButton.setTitle("Change", for: .normal)
        changeNameButton.backgroundColor = .white
        changeNameButton.setTitleColor(.systemBlue, for: .normal)
        changeNameButton.titleLabel?.font = .manrope(18, .medium)
        changeNameButton.addTarget(self, action: #selector(nameClickButton), for: .touchUpInside)
    }

    private func addChangeRatingButtonUI() {
        changeRatingButton.setTitle("Change", for: .normal)
        changeRatingButton.backgroundColor = .white
        changeRatingButton.setTitleColor(.systemBlue, for: .normal)
        changeRatingButton.titleLabel?.font = .manrope(18, .medium)
        changeRatingButton.addTarget(self, action: #selector(ratingClickButton), for: .touchUpInside)
    }

    private func addDateLabelUI() {
        dateLabel.text = "Release Date"
        dateLabel.textColor = .black
        dateLabel.font = .manrope(18, .medium)
        dateLabel.textAlignment = .center
    }

    private func addYoutubeLabelUI() {
        youtubeLabel.text = "YouTube Link"
        youtubeLabel.textColor = .black
        youtubeLabel.font = .manrope(18, .medium)
        youtubeLabel.textAlignment = .center
    }

    private func addMainDateLabelUI() {
        mainDateLabel.text = "-"
        mainDateLabel.textColor = .black
        mainDateLabel.font = .manrope(18, .medium)
        mainDateLabel.textAlignment = .center
    }

    private func addMainYoutubeLabelUI() {
        mainYoutubeLabel.text = "-"
        mainYoutubeLabel.textColor = .black
        mainYoutubeLabel.font = .manrope(18, .medium)
        mainYoutubeLabel.textAlignment = .center
    }

    private func addChangeDateButtonUI() {
        changeDateButton.setTitle("Change", for: .normal)
        changeDateButton.backgroundColor = .white
        changeDateButton.setTitleColor(.systemBlue, for: .normal)
        changeDateButton.titleLabel?.font = .manrope(18, .medium)
        changeDateButton.addTarget(self, action: #selector(dateClickButton), for: .touchUpInside)
    }

    private func addChangeYoutubeButtonUI() {
        changeYoutubeButton.setTitle("Change", for: .normal)
        changeYoutubeButton.backgroundColor = .white
        changeYoutubeButton.setTitleColor(.systemBlue, for: .normal)
        changeYoutubeButton.titleLabel?.font = .manrope(18, .medium)
        changeYoutubeButton.addTarget(self, action: #selector(youTubeClickButton), for: .touchUpInside)
    }

    private func addDescriprionLabelUI() {
        descriptionLabel.text = "Description"
        descriptionLabel.textColor = .black
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .manrope(18, .medium)
    }

    private func addDescriptionTextFieldUI() {
        descriptionTextView.textColor = .lightGray
        descriptionTextView.text = "Enter a movie description"
        descriptionTextView.font = .manrope(14, .regular)
        descriptionTextView.delegate = self
    }

    private func addNavigationControllerUI() {
        title = "Add new"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonClick))
    }

    // MARK: - Actions

    // MARK: Private

    @objc private func saveButtonClick() {
        if isCheckFieldsForEmpty() == true {
            saveMovie(mainNameLabel.text!,
                      mainRatingLabel.text!,
                      mainDateLabel.text!,
                      descriptionTextView.text!,
                      mainYoutubeLabel.text!,
                      pickedImage!)
            navigationController?.popViewController(animated: true)
        } else {
            showAllert("Fill in all fields")
        }
    }

    @objc private func nameClickButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let fillNameVC = storyboard.instantiateViewController(withIdentifier: FilmNameViewController.identifier) as? FilmNameViewController {
            fillNameVC.delegate = self
            navigationController?.pushViewController(fillNameVC, animated: true)
        } else {
            showAllert("Unknown error")
        }
    }

    @objc private func ratingClickButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let pickerVC = storyboard.instantiateViewController(withIdentifier: PickerViewController.identifier) as? PickerViewController {
            navigationController?.pushViewController(pickerVC, animated: true)
            pickerVC.delegate = self
        } else {
            showAllert("Unknown error")
        }
    }

    @objc private func dateClickButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let datePickerVC = storyboard.instantiateViewController(withIdentifier: DatePickerViewController.identifier) as? DatePickerViewController {
            datePickerVC.delegate = self
            navigationController?.pushViewController(datePickerVC, animated: true)
        } else {
            showAllert("Unknown error")
        }
    }

    @objc private func youTubeClickButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let youTubeVC = storyboard.instantiateViewController(withIdentifier: YouTubeLinkViewController.identifier) as? YouTubeLinkViewController {
            navigationController?.pushViewController(youTubeVC, animated: true)
            youTubeVC.delegate = self
        } else {
            showAllert("Unknown error")
        }
    }

    // MARK: - Helpers

    // MARK: Private

    private func showAllert(_ msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    private func isCheckFieldsForEmpty() -> Bool {
        if mainNameLabel.text != "-",
           mainDateLabel.text != "-",
           mainRatingLabel.text != "-",
           mainYoutubeLabel.text != "-",
           pickedImage != nil,
           descriptionTextView.textColor != UIColor.lightGray
        {
            return true
        } else {
            return false
        }
    }
}

// MARK: - ImagePickerControll actions

extension AddMovieViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @objc private func imagePickerBtnAction() {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))

        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }

    private func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    private func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.editedImage] as? UIImage {
            pickedImage = image
            movieImageView.image = pickedImage
        }
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            pickedImage = image
            movieImageView.image = pickedImage
        }
    }
}

// MARK: - TransferDataBetweenVCDelegate

extension AddMovieViewController: TransferDataBetweenVCDelegate {
    func transferMovieRating(_ rating: String) {
        mainRatingLabel.text = rating
    }

    func transferMovieDate(_ date: Date) {
        let dateformatter = DateFormatter()
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

// MARK: - UITextViewDelegate

extension AddMovieViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if descriptionTextView.textColor == UIColor.lightGray {
            descriptionTextView.text = nil
            descriptionTextView.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if descriptionTextView.text.isEmpty {
            descriptionTextView.text = "Enter a movie description"
            descriptionTextView.textColor = UIColor.lightGray
        }
    }
}
