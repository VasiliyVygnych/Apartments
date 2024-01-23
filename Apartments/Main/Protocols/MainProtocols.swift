//
//  MainProtocols.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit

protocol AssemblerProtocol {
    func createHotelView(coordinator: AppCoordinatorProtocol) -> UIViewController
    func createHotelRoomView(model: HotelModel,
                              coordinator: AppCoordinatorProtocol) -> UIViewController
    func createBookingRoomView(model: Room,
                               coordinator: AppCoordinatorProtocol) -> UIViewController
    func createPaymentScreenView(coordinator: AppCoordinatorProtocol) -> UIViewController
}

protocol AppCoordinatorProtocol {
    func initialView()
    func goHotelRoomView(model: HotelModel)
    func goBookingRoomView(model: Room)
    func goPaymentScreenView()
}

protocol ParserProtocol {
    func parseHotelModel(_ data: Data) throws -> HotelModel
    func parseRoomModel(_ data: Data) throws -> RoomModel
    func parseBookingModel(_ data: Data) throws -> BookimgModel
}

protocol NetworkProtocol {
    var parser: ParserProtocol? { get set }
    
    func hotelfetchData(completion: @escaping (HotelModel?) -> Void)
    func roomfetchData(completion: @escaping (RoomModel?) -> Void)
    func bookingfetchData(completion: @escaping (BookimgModel?) -> Void)
}
