//
//  HotelRoomPresenter.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit

class HotelRoomPresenter: HotelRoomPresenterProtocol {
    
    var view: HotelRoomViewProtocol?
    var interactor: HotelRoomInteractorInputProtocol?
    var coordinator: AppCoordinatorProtocol?
    
    
    func viewDidLoad() {
        interactor?.hotelRoomfetchData()
        interactor?.setHotelData()
    }
    func goBookingRoomView() {
        coordinator?.goBookingRoomView()
    }
    func goBookingRoomView(model: Room) {
        coordinator?.goBookingRoomView(model: model)
    }
}

extension HotelRoomPresenter: HotelRoomInteractorOutputProtocol {
    func dataForTheView(model: [Room]) {
        view?.dataSet(model: model)
    }
    func getHotelData(model: HotelModel) {
        view?.giveDataToView(model: model)
    }
}
