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
    var showButton: (() -> Void)?
    var hiddenButton: (() -> Void)?
    
    //MARK: - viewDidLoad
    func viewDidLoad() {
        interactor?.bookingRoomfetchData()
        interactor?.setRoomData()
    }
    //MARK: - goPaymentScreenView
    func goPaymentScreenView() {
        coordinator?.goPaymentScreenView()
    }
    //MARK: - validateCount
    func validateCount(text: String,
                       minimumCount: Int) -> Bool {
        guard text.count >= minimumCount else {
            return false
        }
        return true
    }
    //MARK: - stringValidation
    func stringValidation(text: String,
                          regex: String) -> Bool {
        let check = NSPredicate(format: "SELF MATCHES %@",
                                regex)
        return check.evaluate(with: text)
    }
}
//MARK: - extension BookingInteractorOutputProtocol
extension BookingPresenter: BookingInteractorOutputProtocol {
    func dataForTheView(model: BookimgModel) {
        view?.dataSet(model: model)
    }
    func getRoomData(model: Room) {
        view?.giveDataToView(model: model)
    }
}
