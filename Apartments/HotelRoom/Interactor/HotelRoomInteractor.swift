//
//  HotelRoomInteractor.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import Foundation

class HotelRoomInteractor: HotelRoomInteractorInputProtocol {
    
    var presenter: HotelRoomInteractorOutputProtocol?
    var network: NetworkProtocol?
    
    var hotelModel: HotelModel?
    
//MARK: - hotelRoomfetchData
    func hotelRoomfetchData() {
        network?.roomfetchData(completion: { [ weak self ] data in
            DispatchQueue.main.async {
                guard let model = data else { return }
                self?.presenter?.dataForTheView(model: model.rooms)
            }
        })
    }
//MARK: - setHotelData
    func setHotelData() {
        guard let model = hotelModel else { return }
        presenter?.getHotelData(model: model)
    }   
}
