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
    private var movie: Movie
    private var casts: [Cast] = []
    
    init(for movie: Movie) {
        self.movie = movie
        self.castService = CastService()
    }
    
    func fetchCast() {
        Task {
            await castService.fetchCast(id: movie.id) { [weak self] casts in
                guard let self = self else { return }
                self.casts = casts
                presenter?.fetchedCast(casts)
            }
        }
    }
    
    func fetchMovie() {
        presenter?.fetchedMovie(movie)
    }
}
