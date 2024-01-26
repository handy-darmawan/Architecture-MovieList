//
//  CastDataSource.swift
//  MVVM-MovieList
//
//  Created by ndyyy on 24/01/24.
//

import Foundation

class CastDataSource: CastDataSourceProtocol {
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getCast(movieID: Int, completion: @escaping (Result<[Cast], Error>) -> Void) async {
        let url = URL(string: networkManager.serverAddress + "shows/\(movieID)/cast")!
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data {
                do {
                    let castsDTO = try JSONDecoder().decode([CastDTO].self, from: data)
                    completion(.success(castsDTO.map({CastDTOMapper.map($0)})))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
