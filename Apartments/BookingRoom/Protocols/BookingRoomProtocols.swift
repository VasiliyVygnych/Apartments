//
//  BookingRoomProtocols.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit

protocol BookingViewProtocol {
    var presenter: BookingPresenterProtocol? { get set }
    
    func dataSet(model: BookimgModel)
    func giveDataToView(model: Room)
}

protocol BookingPresenterProtocol {
    var view: BookingViewProtocol? { get set }
    var interactor: BookingInteractorInputProtocol? { get set }
    var coordinator: AppCoordinatorProtocol? { get set }

    func viewDidLoad()
    func goPaymentScreenView()
}

protocol BookingInteractorInputProtocol {
    var presenter: BookingInteractorOutputProtocol? { get set }
    var network: NetworkProtocol? { get set }
    var roomModel: Room? { get set }
    
    func bookingRoomfetchData()
    func setRoomData()
}

protocol BookingInteractorOutputProtocol {
    func dataForTheView(model: BookimgModel)
    func getRoomData(model: Room)
}
