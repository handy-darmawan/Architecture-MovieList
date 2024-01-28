//
//  CastRepository.swift
//  MovieList
//
//  Created by ndyyy on 24/01/24.
//

import Foundation

class CastRepository: CastRepositoryProtocol {
    private let castDataSource: CastDataSourceProtocol = CastDataSource(networkManager: NetworkManager())
    
    func getCast(movieID: Int, handler: @escaping (Result<[Cast], Error>) -> Void) async {
            await castDataSource.getCast(movieID: movieID, completion: handler)
    }
}
