//
//  HomeViewModel.swift
//  MovieList
//
//  Created by ndyyy on 25/01/24.
//

import UIKit
import Combine

class HomeViewModel {
    enum Section { case movies }
    
    private let fetchMovieListsUseCase: FetchMovieListsUseCase
    
    init() {
        self.fetchMovieListsUseCase = FetchMovieListsUseCase()
    }
    
    //MARK: Output
    var movies = CurrentValueSubject<[Movie], Never>([])
    
    func loadMovies() async {
        await fetchMovieListsUseCase.execute { result in
            switch result {
            case .success(let movies):
                self.movies.send(movies)
            case .failure(_):
                self.movies.send([Movie]())
            }
        }
    }
}
