//
//  HomeInteractor.swift
//  MovieList
//
//  Created by ndyyy on 06/01/24.
//

import Foundation

class HomeInteractor: HomePresenterToInteractorProtocol {
    weak var presenter: HomeInteractorToPresenterProtocol?
    var movieService: MovieService
    
    init() {
        self.movieService = MovieService()
    }
    
    func fetchMovies() {
        Task {
            await movieService.fetchMovies { movies in
                self.presenter?.fetchedMovies(movies)
            }
        }
    }
}
