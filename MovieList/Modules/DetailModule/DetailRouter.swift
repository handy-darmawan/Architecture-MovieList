//
//  DetailRouter.swift
//  MovieList
//
//  Created by ndyyy on 06/01/24.
//

import UIKit

class DetailRouter: DetailPresenterToRouterProtocol {
    static func createModule(with movie: Movie) -> UIViewController {
        let view = DetailViewController()
        let presenter: DetailViewToPresenterProtocol & DetailInteractorToPresenterProtocol = DetailPresenter()
        let interactor = DetailInteractor(for: movie)
        let router = DetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
