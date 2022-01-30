import UIKit

final class YouTubeLinkViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: Public
    weak var delegate: TransferDataBetweenVCDelegate?
    // MARK: Private
    private let youTubeLinkLabel: UILabel = UILabel()
    private let youTubeLinkField: UITextField = UITextField()
    private let saveButton: UIButton = UIButton()

    //MARK: - LIfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        addSetupsUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        youTubeLinkField.setUnderLine()
    }
    
    // MARK: - Constraints
    // MARK: Private
    private func addConstraints() {
        addYouTubeLinkLabelConstraint()
        addYouTubeLinkFieldConstraint()
        addSaveButtonConstraint()
    }
    
    private func addYouTubeLinkLabelConstraint() {
        youTubeLinkLabel.translatesAutoresizingMaskIntoConstraints = false
        youTubeLinkLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        youTubeLinkLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        youTubeLinkLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        youTubeLinkLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private func addYouTubeLinkFieldConstraint() {
        youTubeLinkField.translatesAutoresizingMaskIntoConstraints = false
        youTubeLinkField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        youTubeLinkField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        youTubeLinkField.topAnchor.constraint(equalTo: youTubeLinkLabel.bottomAnchor, constant: 42).isActive = true
        youTubeLinkField.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    private func addSaveButtonConstraint() {
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.topAnchor.constraint(equalTo: youTubeLinkField.bottomAnchor, constant: 32).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
    }
    
    // MARK: - Setups
    // MARK: Private
    private func addSubviews() {
        view.addSubViews(youTubeLinkLabel, youTubeLinkField, saveButton)
    }
    
    private func addSetupsUI() {
        addYouTubeLinkLabelUI()
        addYouTubeLinkFieldUI()
        addSaveButtonUI()
    }
    
    private func addYouTubeLinkLabelUI() {
        youTubeLinkLabel.text = "YouTube Link"
        youTubeLinkLabel.textColor = .black
        youTubeLinkLabel.textAlignment = .center
        youTubeLinkLabel.font = .manrope(24, .medium)
    }
    
    private func addYouTubeLinkFieldUI() {
        youTubeLinkField.placeholder = "URL"
        youTubeLinkField.keyboardType = .URL
        youTubeLinkField.delegate = self
    }
    
    private func addSaveButtonUI() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = .white
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.titleLabel?.font = .manrope(18, .medium)
        saveButton.addTarget(self, action: #selector(saveButtonClick), for: .touchUpInside)
    }
    
    // MARK: - Actions
    // MARK: Private
    @objc private func saveButtonClick() {
        if let url = URL(string: youTubeLinkField.text!), url.host != nil {
            delegate?.transferMovieYouTube(url)
            navigationController?.popViewController(animated: true)
        } else {
            showAllert("Add url movie!")
            youTubeLinkField.text = .none
        }
    }
    
    // MARK: - Helpers
    // MARK: Private
    private func showAllert(_ msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.youTubeLinkField.setUnderLine(.red)
        }))
        present(alert, animated: true, completion: nil)
    }
}

extension YouTubeLinkViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
