import UIKit

final class DatePickerViewController: UIViewController {
    
    // MARK: - Actions
    // MARK: Private
    @objc private func saveButtonClick() {
        delegate?.transferMovieDate(datePicker.date)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Properties
    // MARK: Public
    weak var delegate: TransferDataBetweenVCDelegate?    
    // MARK: Private
    private let releaseDateLabel: UILabel = UILabel()
    private let datePicker: UIDatePicker = UIDatePicker()
    private let saveButton: UIButton = UIButton()

    //MARK: - LIfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        addSetupsUI()
    }
    
    // MARK: - Constraints
    // MARK: Private
    private func addConstraints() {
        addRatingLabelConstraint()
        addDatePickerConstraint()
        addSaveButtonConstraint()
    }
    
    private func addRatingLabelConstraint() {
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        releaseDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        releaseDateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        releaseDateLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private func addDatePickerConstraint() {
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 32).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 194).isActive = true
    }
    
    private func addSaveButtonConstraint() {
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 32).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
    }
    
    // MARK: - Setups
    // MARK: Private
    private func addSubviews() {
        view.addSubViews(releaseDateLabel, datePicker, saveButton)
    }
    
    private func addSetupsUI() {
        addRatingLabelUI()
        addDatePickerUI()
        addSaveButtonUI()
    }
    
    private func addRatingLabelUI() {
        releaseDateLabel.text = "Release Date"
        releaseDateLabel.textColor = .black
        releaseDateLabel.textAlignment = .center
        releaseDateLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
    }
    
    private func addDatePickerUI() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
    }
    
    private func addSaveButtonUI() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = .white
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        saveButton.addTarget(self, action: #selector(saveButtonClick), for: .touchUpInside)
    }
}
