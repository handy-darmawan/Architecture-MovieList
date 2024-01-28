//
//  HomePresenter.swift
//  MovieList
//
//  Created by ndyyy on 06/01/24.
//

import Foundation


class HomePresenter: HomeViewToPresenterProtocol {
    weak var view: HomePresenterToViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var router: HomePresenterToRouterProtocol?
    
    var movies: [Movie] = []
    
    func viewDidLoad() {
        interactor?.fetchMovies()
    }
    
    func getTotalMovies() -> Int {
        movies.count
    }
    
    func getMovies(with index: Int) -> Movie {
        movies[index]
    }
    
    func onTappedMovie(with index: Int) {
        router?.pushToDetailScreen(from: view!, with: movies[index])
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    func fetchedMovies(_ movies: [Movie]) {
        self.movies = movies
        view?.fetchedMovies()
    }
}
