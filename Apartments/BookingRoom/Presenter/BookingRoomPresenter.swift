//
//  BookingRoomPresenter.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit

class BookingPresenter: BookingPresenterProtocol {
    
    var view: BookingViewProtocol?
    var interactor: BookingInteractorInputProtocol?
    var coordinator: AppCoordinatorProtocol?
    
    func viewDidLoad() {
        interactor?.bookingRoomfetchData()
        interactor?.setRoomData()
    }
    func goPaymentScreenView() {
        coordinator?.goPaymentScreenView()
    }
}

extension BookingPresenter: BookingInteractorOutputProtocol {
    func dataForTheView(model: BookimgModel) {
        view?.dataSet(model: model)
    }
    func getRoomData(model: Room) {
        view?.giveDataToView(model: model)
    }
}
