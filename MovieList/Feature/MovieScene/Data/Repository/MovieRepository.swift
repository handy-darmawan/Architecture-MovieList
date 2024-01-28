//
//  MovieRepository.swift
//  MovieList
//
//  Created by ndyyy on 25/01/24.
//

import Foundation

class MovieRepository: MovieRepositoryProtocol {
    
    private let movieDataSource = MovieDataSource(networkManager: NetworkManager())
    
    func getMovie(handler: @escaping (Result<[Movie], Error>) -> Void) async {
        await movieDataSource.getMovie(completion: handler)
    }
}
