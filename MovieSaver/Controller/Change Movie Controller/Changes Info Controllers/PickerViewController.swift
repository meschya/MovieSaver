import UIKit

final class PickerViewController: UIViewController {
    
    // MARK: - Actions
    // MARK: Private
    @objc private func saveButtonClick() {
        if rating != nil {
            delegate?.transferMovieRating(rating!)
            navigationController?.popViewController(animated: true)
        } else {
            showAllert("Select rating movie!")
        }
    }
    
    // MARK: - Properties
    // MARK: Public
    weak var delegate: TransferDataBetweenVCDelegate?
    // MARK: Private
    private let yourRatingLabel: UILabel = UILabel()
    private let pickerView: UIPickerView = UIPickerView()
    private let saveButton: UIButton = UIButton()
    private var arrayPickerView: [Double] = []
    private var rating: String?
    
    //MARK: - LIfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        addSetupsUI()
        pickerView.delegate = self
        pickerView.dataSource = self
        arrayPickerView = fillArray()
    }
    
    // MARK: - Constraints
    // MARK: Private
    private func addConstraints() {
        addYourRatingLabelConstraint()
        addPickerViewConstraint()
        addSaveButtonConstraint()
    }
    
    private func addYourRatingLabelConstraint() {
        yourRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        yourRatingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        yourRatingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yourRatingLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        yourRatingLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private func addPickerViewConstraint() {
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: yourRatingLabel.bottomAnchor, constant: 10).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func addSaveButtonConstraint() {
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 32).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
    }
    
    // MARK: - Setups
    // MARK: Private
    private func addSubviews() {
        view.addSubViews(yourRatingLabel, pickerView, saveButton)
    }
    
    private func addSetupsUI() {
        addYourRatingLabelUI()
        addSaveButtonUI()
    }
    
    private func addYourRatingLabelUI() {
        yourRatingLabel.text = "Your Rating"
        yourRatingLabel.textColor = .black
        yourRatingLabel.textAlignment = .center
        yourRatingLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
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
    
    private func fillArray() -> [Double] {
        var array: [Double] = []
        var index: Double = 0
        for _ in 1...99 {
            index += 0.1
            array.append(Double(round(10 * index) / 10))
        }
        return array
    }
}

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        arrayPickerView.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(arrayPickerView[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rating = String(arrayPickerView[row])
    }
    
    // MARK: - Helpers
    // MARK: Private
    private func showAllert(_ msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
