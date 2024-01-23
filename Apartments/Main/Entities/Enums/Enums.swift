//
//  Enums.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 23.01.2024.
//

import Foundation

enum Regex: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case phone = "(\\s*)?(\\+)?([- _():=+]?\\d[- _():=+]?){11,14}(\\s*)?"
}
