//
//  FetchMovieListsUseCase.swift
//  MovieList
//
//  Created by ndyyy on 25/01/24.
//

import Foundation

class FetchMovieListsUseCase: FetchMovieListsUseCaseProtocol {
    private var movieRepository = MovieRepository()
    
    func execute(handler: @escaping (Result<[Movie], Error>) -> Void) async {
        return await movieRepository.getMovie(handler: handler)
    }
}
