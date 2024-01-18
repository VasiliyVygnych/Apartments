//
//  HotelPresenter.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit

class HotelPresenter: HotelPresenterProtocol {
    
    var view: HotelViewProtocol?
    var interactor: HotelInteractorInputProtocol?
    var coordinator: AppCoordinatorProtocol?
    
    func viewDidLoad() {
        interactor?.hotelfetchData()
    }
    func goHotrlRoomViews(model: HotelModel) {
        coordinator?.goHotelRoomView(model: model)
    }
}

extension HotelPresenter: HotelInteractorOutputProtocol {
    func dataForTheView(model: HotelModel) {
        view?.dataSet(model: model)
    }
    
    
    
}
