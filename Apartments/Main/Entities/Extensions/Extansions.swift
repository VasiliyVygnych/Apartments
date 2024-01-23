//
//  Extansions.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 11.01.2024.
//

import UIKit

//MARK: - extension String
extension String {
//MARK: - localized
    func localized() -> String {
        NSLocalizedString(self,
                          tableName: "localization",
                          bundle: .main,
                          value: self,
                          comment: self)
    }
//MARK: - formatterNumber
    func formatterNumber() -> String {
        let cleanPhoneNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mark = "XXXXXXXXXXX"
        var result = ""
        var startIndex = cleanPhoneNumber.startIndex
        let endIndex = cleanPhoneNumber.endIndex
        for charct in mark where startIndex < endIndex {
            if charct == "X" {
                result.append(cleanPhoneNumber[startIndex])
                startIndex = cleanPhoneNumber.index(after: startIndex)
            } else {
                result.append(charct)
            }
        }
        return result
    }
//MARK: - addingMask
    func addingMask(value: String,
                    mask: String) -> String {
        let cleanValue = value.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var result = ""
        var index = cleanValue.startIndex
        for ch in mask where index < cleanValue.endIndex {
        if ch == "*" {
            result.append(cleanValue[index])
            index = cleanValue.index(after: index)
        } else {
            result.append(ch)
            }
        }
        return result
    }
//MARK: - addingMask
    func checkingForCompliance(_ regex: String) -> Bool {
        return self.range(of: regex,
                          options: .regularExpression,
                          range: nil,
                          locale: nil) != nil
    }
}

//MARK: - extension UIFont
extension UIFont {
    enum SFProDisplay: String {
        case bold = "SFProDisplay-Bold"
        case light = "SFProDisplay-Light"
        case regular = "SFProDisplay-Regular"
    }
    class func sFProDisplay(ofSize fonsize: CGFloat, weight: SFProDisplay) -> UIFont {
        return UIFont(name: weight.rawValue, size: fonsize) ?? .systemFont(ofSize: fonsize)
    }
}
