//
//  HomeProtocols.swift
//  MovieList
//
//  Created by ndyyy on 06/01/24.
//

import UIKit

protocol HomeViewToPresenterProtocol {
    var view: HomePresenterToViewProtocol? { get set }
    var interactor: HomePresenterToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }
    
    func viewDidLoad()
    func getTotalMovies() -> Int
    func getMovies(with index: Int) -> Movie
    func onTappedMovie(with index: Int)
}

protocol HomePresenterToViewProtocol: AnyObject {
    func fetchedMovies()
}

protocol HomePresenterToRouterProtocol {
    static func createHomeView() -> UINavigationController
    func pushToDetailScreen(from view: HomePresenterToViewProtocol, with movie: Movie)
}

protocol HomePresenterToInteractorProtocol {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    
    func fetchMovies()
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
    func fetchedMovies(_ movies: [Movie])
}
