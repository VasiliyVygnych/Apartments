//
//  Parser.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 22.01.2024.
//

import Foundation

class Parser: ParserProtocol {

    let snakeCaseJSONDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func parseHotelModel(_ data: Data) throws -> HotelModel {
        try snakeCaseJSONDecoder.decode(HotelModel.self,
                                        from: data)
    }
    func parseRoomModel(_ data: Data) throws -> RoomModel {
        try snakeCaseJSONDecoder.decode(RoomModel.self,
                                        from: data)
    }
    func parseBookingModel(_ data: Data) throws -> BookimgModel {
        try snakeCaseJSONDecoder.decode(BookimgModel.self,
                                        from: data)
    }
}
