//
//  SelfModel.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 22.01.2024.
//

import Foundation

struct SelfModel {
    var model: [TouristListModel]
}

struct TouristListModel {
    var name: [String]? = []
    var surName: [String]?
    var dateOfBirth: [String]?
    var citizenship: [String]?
    var passportNumber: [String]?
    var validityPeriod: [String]?
    var phone: [Int]?
    var email: [String]?
}
