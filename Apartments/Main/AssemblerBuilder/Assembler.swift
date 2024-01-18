//
//  Assembler.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit

class Assembler: AssemblerProtocol {
//MARK: - createHotelView
    func createHotelView(coordinator: AppCoordinatorProtocol) -> UIViewController {
        let viewController = HotelViewController()
        var presenter: HotelPresenterProtocol & HotelInteractorOutputProtocol = HotelPresenter()
        var interactor: HotelInteractorInputProtocol = HotelInteractor()
        let network: NetworkProtocol = Network()
        let coordinator = coordinator
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.coordinator = coordinator
        interactor.presenter = presenter
        interactor.network = network
        return viewController
    }
//MARK: - createHotelRoomView
    func createHotelRoomView(model: HotelModel,
                             coordinator: AppCoordinatorProtocol) -> UIViewController {
        let viewController = HotelRoomViewController()
        var presenter: HotelRoomPresenterProtocol & HotelRoomInteractorOutputProtocol = HotelRoomPresenter()
        var interactor: HotelRoomInteractorInputProtocol = HotelRoomInteractor()
        let network: NetworkProtocol = Network()
        let coordinator = coordinator
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.coordinator = coordinator
        interactor.presenter = presenter
        interactor.network = network
        interactor.hotelModel = model
        return viewController
    }
//MARK: - createBookingRoomView
    func createBookingRoomView(coordinator: AppCoordinatorProtocol) -> UIViewController {
        let viewController = BookingRoomViewController()
        var presenter: BookingPresenterProtocol & BookingInteractorOutputProtocol = BookingPresenter()
        var interactor: BookingInteractorInputProtocol = BookingInteractor()
        let network: NetworkProtocol = Network()
        let coordinator = coordinator
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.coordinator = coordinator
        interactor.presenter = presenter
        interactor.network = network
        return viewController
    }
    func createBookingRoomView(model: Room,
                               coordinator: AppCoordinatorProtocol) -> UIViewController {
        let viewController = BookingRoomViewController()
        var presenter: BookingPresenterProtocol & BookingInteractorOutputProtocol = BookingPresenter()
        var interactor: BookingInteractorInputProtocol = BookingInteractor()
        let network: NetworkProtocol = Network()
        let coordinator = coordinator
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.coordinator = coordinator
        interactor.presenter = presenter
        interactor.network = network
        interactor.roomModel = model
        return viewController
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
//MARK: - createBookingRoomView
    func createPaymentScreenView(coordinator: AppCoordinatorProtocol) -> UIViewController {
        let viewController = PaymentScreenView()
        return viewController
    }
}

