//
//  InfoBuyerView.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit
import SnapKit

class InfoBuyerView: UIView {
    
    var presenter: BookingPresenterProtocol?
    
//MARK: - UILabel
    private var infoBuyerLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_25),
                                   weight: .regular)
        label.text = Constants.Text.infoBuyerLabel
        return label
    }()
    private var orderLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "textGrey")
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_14),
                                   weight: .light)
        label.text = Constants.Text.orderLabel
        return label
    }()
//MARK: - UITextField
   private var numberTexField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_10)
        textField.placeholder = Constants.Text.numberTexField
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                       weight: .light)
        textField.backgroundColor = UIColor(named: "backgroundGray")
        return textField
    }()
    private var emailTexField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_10)
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                       weight: .light)
        textField.placeholder = Constants.Text.emailTexField
        textField.backgroundColor = UIColor(named: "backgroundGray")
        return textField
    }()
//MARK: - init
    init() {
        super.init(frame: .zero)
        initialization()
        setupeConstraint()
        setupeTextfield()
        self.backgroundColor = .white
        self.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_15)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - extension
private extension InfoBuyerView {
    func initialization() {
        self.addSubview(infoBuyerLabel)
        self.addSubview(orderLabel)
        self.addSubview(numberTexField)
        self.addSubview(emailTexField)
    }
//MARK: - setupeTextfield
    func setupeTextfield() {
        numberTexField.delegate = self
        emailTexField.delegate = self
        numberTexField.text = "+7 (***) ***-**-**"
    }
//MARK: - setupeConstraint
    func setupeConstraint() {
        infoBuyerLabel.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.height.equalTo(26)
            make.width.equalTo(343)
            make.left.equalTo(Integers.Constraints.sideMargins)
        }
        orderLabel.snp.makeConstraints { make in
            make.top.equalTo(182)
            make.height.equalTo(34)
            make.leading.trailing.equalToSuperview().inset(Integers.Constraints.sideMargins)
        }
        numberTexField.snp.makeConstraints { make in
            make.top.equalTo(62)
            make.height.equalTo(52)
            make.leading.trailing.equalToSuperview().inset(Integers.Constraints.sideMargins)
        }
        emailTexField.snp.makeConstraints { make in
            make.top.equalTo(122)
            make.height.equalTo(52)
            make.leading.trailing.equalToSuperview().inset(Integers.Constraints.sideMargins)
        }
    }
}
//MARK: - extension UITextFieldDelegate
extension InfoBuyerView: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                  shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range,
                                                               with: string)
        if textField == numberTexField {
            let mask = "+* (***) ***-**-**"
            numberTexField.text = "".addingMask(value: newString,
                                                mask: mask)
            if presenter?.stringValidation(text: newString,
                                           regex: Regex.phone.rawValue) == true {
                numberTexField.backgroundColor = .white
            } else {
                numberTexField.backgroundColor = UIColor(named: "error")
            }
        }
        if textField == emailTexField {
            if presenter?.stringValidation(text: newString,
                                           regex: Regex.email.rawValue) == true {
                emailTexField.backgroundColor = .white
            } else {
                emailTexField.backgroundColor = UIColor(named: "error")
            }
            emailTexField.text = newString
        }
        return false
    }
    
//MARK: - textFieldShouldReturn
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
