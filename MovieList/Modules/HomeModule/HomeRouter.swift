//
//  HomeRouter.swift
//  MovieList
//
//  Created by ndyyy on 06/01/24.
//

import UIKit

class HomeRouter: HomePresenterToRouterProtocol {
    static func createHomeView() -> UINavigationController {
        let view = HomeViewController()
        var presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        let navigationController = UINavigationController(rootViewController: view)
        return navigationController
    }
    
    func pushToDetailScreen(from view: HomePresenterToViewProtocol, with movie: Movie) {
        let detailView = DetailRouter.createModule(with: movie)
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(detailView, animated: true)
        }
    }
}
