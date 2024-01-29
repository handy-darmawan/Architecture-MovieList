//
//  DetailPresenter.swift
//  MovieList
//
//  Created by ndyyy on 06/01/24.
//

import Foundation

class DetailPresenter: DetailViewToPresenterProtocol {
    weak var view: DetailPresenterToViewProtocol?
    var interactor: DetailPresenterToInteractorProtocol?
    var router: DetailPresenterToRouterProtocol?
    var casts: [Cast] = []
    
    func viewDidLoad() {
        interactor?.fetchMovie()
        interactor?.fetchCast()
    }
    
    func getCasts() -> [Cast] {
        return casts
    }
}

extension DetailPresenter: DetailInteractorToPresenterProtocol {
    func fetchedCast(_ casts: [Cast]) {
        self.casts = casts
        view?.fetchedCast()
    }
    
    func fetchedMovie(_ movie: Movie) {
        view?.fetchedMovie(movie)
    }
}
