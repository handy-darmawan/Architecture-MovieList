//
//  MockHomeView.swift
//  MovieListTests
//
//  Created by ndyyy on 05/02/24.
//

import XCTest
@testable import MovieList

class MockHomeView: HomePresenterToViewProtocol {
    var isFetchedChecker = false
    
    func fetchedMovies() {
        isFetchedChecker = true
    }
}

class MockHomeInteractor: HomePresenterToInteractorProtocol {
    weak var presenter: HomeInteractorToPresenterProtocol?
    var movieService: MovieService
    private(set) var movies: [Movie] = []
    var expectation: XCTestExpectation!
    
    init() {
        self.movieService = MovieService()
    }
    
    func fetchMovies() {
        Task {
            await movieService.fetchMovies { [weak self] movies in
                guard let self = self else { return }
                
                self.movies = movies
                presenter?.fetchedMovies(movies)
                expectation.fulfill()
            }
        }
    }
}


class MockHomeRouter: HomePresenterToRouterProtocol {
    
    var isPushToDetailIsCalled = false
    
    static func createHomeView() -> UINavigationController {
        return UINavigationController()
    }
    
    func pushToDetailScreen(from view: MovieList.HomePresenterToViewProtocol, with movie: MovieList.Movie) {
        isPushToDetailIsCalled = true
    }
}


class MockHomePresenter: HomeViewToPresenterProtocol, HomeInteractorToPresenterProtocol {
    var view: MovieList.HomePresenterToViewProtocol?
    var interactor: MovieList.HomePresenterToInteractorProtocol?
    var router: MovieList.HomePresenterToRouterProtocol?
    
    var expectation: XCTestExpectation!
    var isViewDidLoaded: Bool = false
    var movies: [Movie] = []
    
    func viewDidLoad() {
        isViewDidLoaded = true
        interactor?.fetchMovies()
    }
    
    func onTappedMovie(with index: Int) {
        router?.pushToDetailScreen(from: view!, with: movies[index])
    }
    
    func getMovies() -> [MovieList.Movie] {
        return [MovieList.Movie]()
    }
    
    func fetchedMovies(_ movies: [MovieList.Movie]) {
        self.movies = movies
        view?.fetchedMovies()
        expectation.fulfill()
    }
}

