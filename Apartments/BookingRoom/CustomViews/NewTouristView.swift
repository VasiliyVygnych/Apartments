//
//  NewTouristView.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit
import SnapKit

class NewTourustView: UIStackView {
    private var newView: [UIView] = []
    var presenter: BookingPresenterProtocol?

//MARK: - UIView
    var contentView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
    var upperView: UIView = {
       let contView = UIView()
        contView.translatesAutoresizingMaskIntoConstraints = false
        contView.backgroundColor = .white
        return contView
    }()
    var topView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
//MARK: - UILabel
     var touristLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
         label.text = Constants.Text.firstTourist
        label.font = .systemFont(ofSize: 22, weight: .regular)
        return label
    }()
//MARK: - UITextField
     var firstName: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
         textField.placeholder = Constants.Text.firstName
        textField.borderStyle = .roundedRect
        textField.font = .sFProDisplay(ofSize: 17,
                                       weight: .light)
        textField.backgroundColor = UIColor(named: "backgroundGray")
        return textField
    }()
     var surName: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
         textField.placeholder = Constants.Text.surName
        textField.borderStyle = .roundedRect
        textField.font = .sFProDisplay(ofSize: 17,
                                       weight: .light)
        textField.backgroundColor = UIColor(named: "backgroundGray")
        return textField
    }()
     var dateOfBirth: UITextField = {
       let textField = UITextField()
         textField.translatesAutoresizingMaskIntoConstraints = false
         textField.layer.cornerRadius = 10
         textField.font = .sFProDisplay(ofSize: 17,
                                       weight: .light)
         textField.placeholder = Constants.Text.dateOfBirth
         textField.borderStyle = .roundedRect
         textField.keyboardType = .numberPad
         textField.backgroundColor = UIColor(named: "backgroundGray")
        return textField
    }()
     var citizenship: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
         textField.placeholder = Constants.Text.citizenship
        textField.font = .sFProDisplay(ofSize: 17,
                                       weight: .light)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(named: "backgroundGray")
        return textField
    }()
     var passportNumber: UITextField = {
       let textField = UITextField()
         textField.placeholder = Constants.Text.numberTexField
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.font = .sFProDisplay(ofSize: 17,
                                       weight: .light)
         textField.placeholder = Constants.Text.passportNumber
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.backgroundColor = UIColor(named: "backgroundGray")
        return textField
    }()
     var validityPeriod: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.font = .sFProDisplay(ofSize: 17,
                                       weight: .light)
         textField.placeholder = Constants.Text.validityPeriod
        textField.borderStyle = .roundedRect
         textField.keyboardType = .numberPad
        textField.backgroundColor = UIColor(named: "backgroundGray")
        return textField
    }()
//MARK: - UIButton
    var button: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "arrow"),
                                          for: .normal)
        button.backgroundColor = UIColor(named: "primaryButtons")
        button.layer.cornerRadius = 10
        return button
    }()
//MARK: - init
    init() {
        super.init(frame: .zero)
        initialization()
        setupeConstraint()
        setupeTextField()
        self.backgroundColor = .white
        self.axis = .vertical
        self.layer.cornerRadius = 15
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(UIView.endEditing))
        self.addGestureRecognizer(tapGesture)
        button.addTarget(self,
                         action: #selector(showHiddenView),
                         for: .touchUpInside)
        contentView.isHidden = true
        newView.append(contentView)
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - @objc func showHiddenView
    @objc func showHiddenView() {
        currentBackgroundImage()
        newView.forEach { buttom in
            UIView.animate(withDuration: 0.1) {
                buttom.isHidden = !buttom.isHidden
                self.layoutIfNeeded()
            }
        }
    }
//MARK: - currentBackgroundImage
    private func currentBackgroundImage() {
        if button.currentBackgroundImage == UIImage(named: "arrow") {
            button.setBackgroundImage(UIImage(named: "arrow2"),
                                          for: .normal)
        } else {
            button.setBackgroundImage(UIImage(named: "arrow"),
                                          for: .normal)
        }
    }
}
//MARK: - extension
private extension NewTourustView {
    func initialization() {
        self.addArrangedSubview(topView)
        topView.addSubview(button)
        topView.addSubview(touristLabel)
        self.addArrangedSubview(contentView)
        contentView.addSubview(upperView)
        contentView.addSubview(firstName)
        contentView.addSubview(surName)
        contentView.addSubview(dateOfBirth)
        contentView.addSubview(citizenship)
        contentView.addSubview(passportNumber)
        contentView.addSubview(validityPeriod)
    }
//MARK: - setupeTextField
    func setupeTextField() {
        firstName.delegate = self
        surName.delegate = self
        dateOfBirth.delegate = self
        citizenship.delegate = self
        passportNumber.delegate = self
        validityPeriod.delegate = self
    }
//MARK: - setupeConstraint
    func setupeConstraint() {
        contentView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(380)
        }
        upperView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-10)
            make.width.equalToSuperview()
            make.height.equalTo(20)
        }
        firstName.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.height.equalTo(52)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        surName.snp.makeConstraints { make in
            make.top.equalTo(76)
            make.height.equalTo(52)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        dateOfBirth.snp.makeConstraints { make in
            make.top.equalTo(135)
            make.height.equalTo(52)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        citizenship.snp.makeConstraints { make in
            make.top.equalTo(195)
            make.height.equalTo(52)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        passportNumber.snp.makeConstraints { make in
            make.top.equalTo(255)
            make.height.equalTo(52)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        validityPeriod.snp.makeConstraints { make in
            make.top.equalTo(315)
            make.height.equalTo(52)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        topView.snp.makeConstraints { make in
            make.height.equalTo(58)
        }
        touristLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(16)
            make.height.equalTo(26)
        }
        button.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(32)
            make.trailing.equalTo(-16)
        }
    }
}

//MARK: - extension UITextFieldDelegate
extension NewTourustView: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                  shouldChangeCharactersIn range: NSRange,
                  replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range,
                                                               with: string)
        if textField == dateOfBirth {
            let mask = "**-**-****"
            dateOfBirth.text = "".addingMask(value: newString,
                                             mask: mask)
            if presenter?.validateCount(text: newString,
                                        minimumCount: 10) == true {
                dateOfBirth.backgroundColor = .white
                dateOfBirth.isAccessibilityElement = true
            } else {
                dateOfBirth.isAccessibilityElement = false
                dateOfBirth.backgroundColor = UIColor(named: "error")
            }
            checkingАllValues()
        }
        if textField == passportNumber {
            let mask = "****-******"
            passportNumber.text = "".addingMask(value: newString,
                                                mask: mask)
            if presenter?.validateCount(text: newString,
                                        minimumCount: 11) == true {
                passportNumber.backgroundColor = .white
                passportNumber.isAccessibilityElement = true
            } else {
                passportNumber.backgroundColor = UIColor(named: "error")
                passportNumber.isAccessibilityElement = false
            }
            checkingАllValues()
        }
        if textField == validityPeriod {
            let mask = "**-**-****"
            validityPeriod.text = "".addingMask(value: newString,
                                                mask: mask)
            if presenter?.validateCount(text: newString,
                                        minimumCount: 10) == true {
                validityPeriod.backgroundColor = .white
                validityPeriod.isAccessibilityElement = true
            } else {
                validityPeriod.backgroundColor = UIColor(named: "error")
                validityPeriod.isAccessibilityElement = false
            }
            checkingАllValues()
        }
        if textField == firstName {
            firstName.text = newString
            if presenter?.validateCount(text: newString,
                                        minimumCount: 3) == true {
                firstName.backgroundColor = .white
                firstName.isAccessibilityElement = true
            } else {
                firstName.backgroundColor = UIColor(named: "error")
                firstName.isAccessibilityElement = false
            }
            checkingАllValues()
        }
        if textField == surName {
            surName.text = newString
            if presenter?.validateCount(text: newString,
                                        minimumCount: 3) == true {
                surName.backgroundColor = .white
                surName.isAccessibilityElement = true
            } else {
                surName.backgroundColor = UIColor(named: "error")
                surName.isAccessibilityElement = false
            }
            checkingАllValues()
        }
        if textField == citizenship {
            citizenship.text = newString
            if presenter?.validateCount(text: newString,
                                        minimumCount: 3) == true {
                citizenship.backgroundColor = .white
                citizenship.isAccessibilityElement = true
            } else {
                citizenship.backgroundColor = UIColor(named: "error")
                citizenship.isAccessibilityElement = false
            }
            checkingАllValues()
        }
        return false
    }
//MARK: - textFieldShouldReturn
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
//MARK: - checkingАllValues
    func checkingАllValues() {
        if dateOfBirth.isAccessibilityElement && passportNumber.isAccessibilityElement && validityPeriod.isAccessibilityElement && firstName.isAccessibilityElement && surName.isAccessibilityElement && citizenship.isAccessibilityElement == true {
            presenter?.showButton?()
        } else {
            presenter?.hiddenButton?()
        }
    }
}

