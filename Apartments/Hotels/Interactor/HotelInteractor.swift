//
//  HotelInteractor.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import Foundation

class HotelInteractor: HotelInteractorInputProtocol {
    
    var presenter: HotelInteractorOutputProtocol?
    var network: NetworkProtocol?
    
//MARK: - hotelfetchData
    func hotelfetchData() {
        network?.hotelfetchData(completion: { [ weak self ] data in
            DispatchQueue.main.async {
                guard let model = data else { return }
                self?.presenter?.dataForTheView(model: model)
            }
        })
    }   
}
