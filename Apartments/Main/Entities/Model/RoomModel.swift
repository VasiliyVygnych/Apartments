//
//  RoomModel.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 22.01.2024.
//

import Foundation

struct RoomModel: Codable {
    let rooms: [Room]
}
struct Room: Codable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]
}
