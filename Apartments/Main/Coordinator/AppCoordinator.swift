//
//  AppCoordinator.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit

class AppCoordinator: AppCoordinatorProtocol {
    
    var navigationController: UINavigationController?
    var assembler: AssemblerProtocol
    
    init(navigationController: UINavigationController?,
         assembler: AssemblerProtocol = Assembler()) {
        self.navigationController = navigationController
        self.assembler = assembler
    }
    
//MARK: - initialView
    func initialView() {
        if let navigationController = navigationController {
            let hotelView = assembler.createHotelView(coordinator: self)
            navigationController.viewControllers = [hotelView]
        }
    }
//MARK: - goHotelroomView
    func goHotelRoomView(model: HotelModel) {
        if let navigationController = navigationController {
            let bookingRoomView = assembler.createHotelRoomView(model: model,
                                                                coordinator: self)
            navigationController.pushViewController(bookingRoomView,
                                                    animated: true)
        }
    }
//MARK: - goBookingRoomView
    func goBookingRoomView(model: Room) {
        if let navigationController = navigationController {
            let bookingRoomView = assembler.createBookingRoomView(model: model,
                                                                  coordinator: self)
            navigationController.pushViewController(bookingRoomView,
                                                    animated: true)
        }
    }  
//MARK: - goPaymentScreenView
    func goPaymentScreenView() {
        if let navigationController = navigationController {
            let paymentView = assembler.createPaymentScreenView(coordinator: self)
            navigationController.pushViewController(paymentView,
                                                    animated: true)
        }
    }   
}
