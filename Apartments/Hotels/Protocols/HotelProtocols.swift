//
//  HotelProtocols.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit

protocol HotelViewProtocol {
    var presenter: HotelPresenterProtocol? { get set }
    
    func dataSet(model: HotelModel)
}

protocol HotelPresenterProtocol {
    var view: HotelViewProtocol? { get set }
    var interactor: HotelInteractorInputProtocol? { get set }
    var coordinator: AppCoordinatorProtocol? { get set }

    func viewDidLoad()
    func goHotrlRoomViews(model: HotelModel)
}

protocol HotelInteractorInputProtocol {
    var presenter: HotelInteractorOutputProtocol? { get set }
    var network: NetworkProtocol? { get set }
    
    func hotelfetchData()
}

protocol HotelInteractorOutputProtocol {
    func dataForTheView(model: HotelModel)
    
}

