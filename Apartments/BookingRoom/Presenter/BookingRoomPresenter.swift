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
    var updateView: (() -> Void)?
    
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
                       textField: UITextField,
                       minimumCount: Int) {
        guard text.count >= minimumCount else {
            textField.backgroundColor = UIColor(named: "error")
            return
        }
        textField.backgroundColor = .white
    }
//MARK: - validateText
    func stringValidation(text: String,
                      regex: String,
                      textField: UITextField) {
        guard text.checkingForCompliance(regex) else {
            textField.backgroundColor = UIColor(named: "error")
            return
        }
        textField.backgroundColor = .white
   }
//MARK: - checkingАllValues
    func checkingАllValues() {
//            updateView?()
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
