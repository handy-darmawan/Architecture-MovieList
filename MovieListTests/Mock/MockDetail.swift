//
//  MockDetail.swift
//  MovieListTests
//
//  Created by ndyyy on 05/02/24.
//

import XCTest
@testable import MovieList

class MockDetailView: DetailPresenterToViewProtocol {
    func fetchedCast() {
        
    }
    
    func fetchedMovie(_ movie: MovieList.Movie) {
        
    }
}


class MockDetailPresenter: DetailViewToPresenterProtocol, DetailInteractorToPresenterProtocol {
    var view: MovieList.DetailPresenterToViewProtocol?
    var interactor: MovieList.DetailPresenterToInteractorProtocol?
    var router: MovieList.DetailPresenterToRouterProtocol?
    var casts: [MovieList.Cast] = []
    
    var expectation: XCTestExpectation!
    
    func viewDidLoad() {
        interactor?.fetchMovie()
        interactor?.fetchCast()
    }
    
    func getCasts() -> [MovieList.Cast] {
        casts
    }
    
    func fetchedCast(_ casts: [MovieList.Cast]) {
        self.casts = casts
        view?.fetchedCast()
        expectation.fulfill()
    }
    
    func fetchedMovie(_ movie: MovieList.Movie) {
        view?.fetchedMovie(movie)
    }
}

class MockDetailInteractor: DetailPresenterToInteractorProtocol {
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
