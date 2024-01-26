//
//  MovieDataSource.swift
//  MVVM-MovieList
//
//  Created by ndyyy on 24/01/24.
//

import Foundation

class MovieDataSource: MovieDataSourceProtocol {
    var networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getMovie(completion: @escaping (Result<[Movie], Error>) -> Void) async {
        let url = URL(string: networkManager.serverAddress + "shows")!
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let data = data {
                do {
                    let moviesDTO = try JSONDecoder().decode([MovieDTO].self, from: data)
                    completion(.success(moviesDTO.map({MovieDTOMapper.map($0)})))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        .resume()
    }
}
