import UIKit

final class FilmNameViewController: UIViewController {
    
    // MARK: - Actions
    // MARK: Private
    @objc private func saveButtonClick() {
        if fillNameTextField.text != "" {
            let name = fillNameTextField.text ?? ""
            delegate?.transferMovieName(name)
            navigationController?.popViewController(animated: true)
        } else {
            showAllert("Fill name movie!")
        }
    }
    
    // MARK: - Properties
    // MARK: Public
    weak var delegate: TransferDataBetweenVCDelegate?
    // MARK: Private
    private let fillNameLabel: UILabel = UILabel()
    private let fillNameTextField: UITextField = UITextField()
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
        fillNameTextField.setUnderLine()
    }
    
    // MARK: - Constraints
    // MARK: Private
    private func addConstraints() {
        addFilmNameLabelConstraint()
        addFillNameTextFieldConstraint()
        addSaveButtonConstraint()
    }
    
    private func addFilmNameLabelConstraint() {
        fillNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fillNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        fillNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fillNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        fillNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private func addFillNameTextFieldConstraint() {
        fillNameTextField.translatesAutoresizingMaskIntoConstraints = false
        fillNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        fillNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        fillNameTextField.topAnchor.constraint(equalTo: fillNameLabel.bottomAnchor, constant: 42).isActive = true
        fillNameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    private func addSaveButtonConstraint() {
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.topAnchor.constraint(equalTo: fillNameTextField.bottomAnchor, constant: 32).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
    }
    
    // MARK: - Setups
    // MARK: Private
    private func addSubviews() {
        view.addSubViews(fillNameLabel, fillNameTextField, saveButton)
    }
    
    private func addSetupsUI() {
        addFillNameLabelUI()
        addFillNameTextFieldUI()
        addSaveButtonUI()
    }
    
    private func addFillNameLabelUI() {
        fillNameLabel.text = "Fill Name"
        fillNameLabel.textColor = .black
        fillNameLabel.textAlignment = .center
        fillNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
    }
    
    private func addFillNameTextFieldUI() {
        fillNameTextField.placeholder = "Name"
    }
    
    private func addSaveButtonUI() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = .white
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        saveButton.addTarget(self, action: #selector(saveButtonClick), for: .touchUpInside)
    }
    
    // MARK: - Helpers
    // MARK: Private
    private func showAllert(_ msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.fillNameTextField.setUnderLine(.red)
        }))
        present(alert, animated: true, completion: nil)
    }
}
