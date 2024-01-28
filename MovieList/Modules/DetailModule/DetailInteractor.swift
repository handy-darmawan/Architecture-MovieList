//
//  DetailInteractor.swift
//  MovieList
//
//  Created by ndyyy on 06/01/24.
//

import UIKit

class DetailInteractor: DetailPresenterToInteractorProtocol {
    weak var presenter: DetailInteractorToPresenterProtocol?
    var castService: CastService
    var movie: Movie
    
    init(for movie: Movie) {
        self.movie = movie
        self.castService = CastService()
    }
    
    func fetchCast() {
        Task {
            await castService.fetchCast(id: movie.id) { casts in
                self.presenter?.fetchedCast(casts)
            }
        }
    }
    
    func fetchMovie() {
        presenter?.fetchedMovie(movie)
    }
    
}
