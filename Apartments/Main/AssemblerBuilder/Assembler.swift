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
        let parser: ParserProtocol = Parser()
        var network: NetworkProtocol = Network()
        let coordinator = coordinator
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.coordinator = coordinator
        interactor.presenter = presenter
        interactor.network = network
        network.parser = parser
        return viewController
    }
//MARK: - createHotelRoomView
    func createHotelRoomView(model: HotelModel,
                             coordinator: AppCoordinatorProtocol) -> UIViewController {
        let viewController = HotelRoomViewController()
        var presenter: HotelRoomPresenterProtocol & HotelRoomInteractorOutputProtocol = HotelRoomPresenter()
        var interactor: HotelRoomInteractorInputProtocol = HotelRoomInteractor()
        let parser: ParserProtocol = Parser()
        var network: NetworkProtocol = Network()
        let coordinator = coordinator
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.coordinator = coordinator
        interactor.presenter = presenter
        interactor.network = network
        interactor.hotelModel = model
        network.parser = parser
        return viewController
    }
//MARK: - createBookingRoomView
    func createBookingRoomView(model: Room,
                               coordinator: AppCoordinatorProtocol) -> UIViewController {
        let viewController = BookingRoomViewController()
        var presenter: BookingPresenterProtocol & BookingInteractorOutputProtocol = BookingPresenter()
        var interactor: BookingInteractorInputProtocol = BookingInteractor()
        let parser: ParserProtocol = Parser()
        var network: NetworkProtocol = Network()
        let coordinator = coordinator
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.coordinator = coordinator
        interactor.presenter = presenter
        interactor.network = network
        interactor.roomModel = model
        network.parser = parser
        return viewController
    }
//MARK: - createBookingRoomView
    func createPaymentScreenView(coordinator: AppCoordinatorProtocol) -> UIViewController {
        let viewController = PaymentScreenView()
        return viewController
    }
}

