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
    var movies: [Movie] = []
    
    init() {
        self.movieService = MovieService()
    }
    
    func fetchMovies() {
        Task {
            await movieService.fetchMovies { [weak self] movies in
                guard let self = self else { return }
                
                self.movies = movies
                presenter?.fetchedMovies(movies)
            }
        }
    }
}
