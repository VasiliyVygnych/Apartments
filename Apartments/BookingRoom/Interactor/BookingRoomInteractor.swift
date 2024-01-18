//
//  BookingRoomInteractor.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import Foundation

class BookingInteractor: BookingInteractorInputProtocol {
    
    var presenter: BookingInteractorOutputProtocol?
    var network: NetworkProtocol?
    var roomModel: Room?
    
//MARK: - bookingRoomfetchData
    func bookingRoomfetchData() {
        network?.bookingfetchData(completion: { [ weak self ] data in
            DispatchQueue.main.async {
                guard let model = data else { return }
                self?.presenter?.dataForTheView(model: model)
            }
        })
    }
//MARK: - setRoomData
    func setRoomData() {
        guard let model = roomModel else { return }
        presenter?.getRoomData(model: model)
    }
}
