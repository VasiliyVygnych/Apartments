//
//  HotelRoomProtocols.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit

protocol HotelRoomViewProtocol {
    var presenter: HotelRoomPresenterProtocol? { get set }
    
    func dataSet(model: [Room])
    func giveDataToView(model: HotelModel)
}

protocol HotelRoomPresenterProtocol {
    var view: HotelRoomViewProtocol? { get set }
    var interactor: HotelRoomInteractorInputProtocol? { get set }
    var coordinator: AppCoordinatorProtocol? { get set }

    func viewDidLoad()
    func goBookingRoomView(model: Room)
}

protocol HotelRoomInteractorInputProtocol {
    var presenter: HotelRoomInteractorOutputProtocol? { get set }
    var network: NetworkProtocol? { get set }
    var hotelModel: HotelModel? { get set }
    
    func hotelRoomfetchData()
    func setHotelData()
}

protocol HotelRoomInteractorOutputProtocol {
    func dataForTheView(model: [Room])
    func getHotelData(model: HotelModel)
}
