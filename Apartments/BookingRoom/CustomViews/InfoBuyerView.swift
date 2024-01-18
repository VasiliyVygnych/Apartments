//
//  InfoBuyerView.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit
import SnapKit

class InfoBuyerView: UIView {

//MARK: - UILabel
    private var infoBuyerLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .sFProDisplay(ofSize: 25,
                                   weight: .regular)
        label.text = "Информация о покупателе"
        return label
    }()
    private var orderLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "textGrey")
        label.font = .sFProDisplay(ofSize: 14,
                                   weight: .light)
        label.text = "Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту"
        return label
    }()
//MARK: - UITextField
    var numberTexField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.placeholder = "Номер телефона"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .namePhonePad
        textField.font = .sFProDisplay(ofSize:
                                        17, weight: .light)
        textField.backgroundColor = UIColor(named: "backgroundGray")
        return textField
    }()
    var emailTexField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.font = .sFProDisplay(ofSize: 17,
                                       weight: .light)
        textField.placeholder = "Почта"
        textField.backgroundColor = UIColor(named: "backgroundGray")
        return textField
    }()
//MARK: - init
    init() {
        super.init(frame: .zero)
        initialization()
        setupeConstraint()
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
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
            make.left.equalTo(16)
        }
        orderLabel.snp.makeConstraints { make in
            make.top.equalTo(182)
            make.height.equalTo(34)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        numberTexField.snp.makeConstraints { make in
            make.top.equalTo(62)
            make.height.equalTo(52)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        emailTexField.snp.makeConstraints { make in
            make.top.equalTo(122)
            make.height.equalTo(52)
            make.leading.trailing.equalToSuperview().inset(16)
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
            if newString.count > 17 {
                let phoneNumber = newString.formatterNumber()
                print("numberTexField \(phoneNumber)")
            }
        }
        if textField == emailTexField {
            emailTexField.text = newString
            print("emailTexField \(newString)")
        }
        return false
    }
}
