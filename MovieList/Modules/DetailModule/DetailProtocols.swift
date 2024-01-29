//
//  DetailProtocols.swift
//  MovieList
//
//  Created by ndyyy on 06/01/24.
//

import UIKit

protocol DetailViewToPresenterProtocol: AnyObject {
    var view: DetailPresenterToViewProtocol? { get set }
    var interactor: DetailPresenterToInteractorProtocol? { get set }
    var router: DetailPresenterToRouterProtocol? { get set }
    
    func viewDidLoad()
    func getCasts() -> [Cast]
}

protocol DetailPresenterToViewProtocol: AnyObject {
    func fetchedCast()
    func fetchedMovie(_ movie: Movie)
}

protocol DetailPresenterToRouterProtocol: AnyObject {
    static func createModule(with movie: Movie) -> UIViewController
}

protocol DetailPresenterToInteractorProtocol: AnyObject {
    var presenter: DetailInteractorToPresenterProtocol? { get set }
    
    func fetchCast()
    func fetchMovie()
}

protocol DetailInteractorToPresenterProtocol: AnyObject {
    func fetchedCast(_ casts: [Cast])
    func fetchedMovie(_ movie: Movie)
}
