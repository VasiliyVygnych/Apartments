//
//  Network.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import Foundation

class Network: NetworkProtocol {
    
//MARK: - request
    func request(urlString: String,
                 completion: @escaping ( Result <Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }.resume()
    }
//MARK: - hotelfetchData
    func hotelfetchData(completion: @escaping (HotelModel?) -> Void) {
        let urlString = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
        request(urlString: urlString) { (result)  in
            switch result {
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode(HotelModel.self,
                                                         from: data)
                    completion(model)
                } catch let jsonError {
                    print("ERROR", jsonError)
                    completion(nil)
                }
            case .failure(let error):
                print("ERROR DATA \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
//MARK: - roomfetchData
    func roomfetchData(completion: @escaping (RoomModel?) -> Void) {
        let urlString = "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195"
        request(urlString: urlString) { (result)  in
            switch result {
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode(RoomModel.self,
                                                         from: data)
                    completion(model)
                } catch let jsonError {
                    print("ERROR", jsonError)
                    completion(nil)
                }
            case .failure(let error):
                print("ERROR DATA \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
//MARK: - bookingfetchData
    func bookingfetchData(completion: @escaping (BookimgModel?) -> Void) {
        let urlString = "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff"
        request(urlString: urlString) { (result)  in
            switch result {
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode(BookimgModel.self,
                                                         from: data)
                    completion(model)
                } catch let jsonError {
                    print("ERROR", jsonError)
                    completion(nil)
                }
            case .failure(let error):
                print("ERROR DATA \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
    
}
