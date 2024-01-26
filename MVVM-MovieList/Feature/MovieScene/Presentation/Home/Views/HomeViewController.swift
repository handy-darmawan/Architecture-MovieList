//
//  HomeViewController.swift
//  MVVM-MovieList
//
//  Created by ndyyy on 22/01/24.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    var homeVM = HomeViewModel()
    private var cancellable = Set<AnyCancellable>()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
     
        subscribe()
        fetchData()
        
    }
    
    func subscribe() {
        homeVM.movies
            .receive(on: RunLoop.main)
            .sink { movies in
                if movies.count != 0 {
                    dump(movies[0])
                }
            }
            .store(in: &cancellable)
    }
    
    func fetchData() {
        Task {
            await homeVM.loadMovies()
        }
    }
}
