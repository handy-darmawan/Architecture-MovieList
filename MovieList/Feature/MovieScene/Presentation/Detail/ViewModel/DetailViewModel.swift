//
//  DetailViewModel.swift
//  MovieList
//
//  Created by ndyyy on 25/01/24.
//

import UIKit
import Combine


class DetailViewModel {
    
    enum Section { case cast }
    
    
    private let fetchCastUseCase: FetchCastListsUseCase
    let movie: Movie!
    
    //MARK: - Output
    var casts = CurrentValueSubject<[Cast], Never>([])
    
    init(movie: Movie) {
        self.movie = movie
        fetchCastUseCase = FetchCastListsUseCase()
    }
    
    func loadCast(movieID: Int) async {
        await fetchCastUseCase.execute(movieID: movieID) { result in
            switch result {
            case .success(let casts):
                self.casts.send(casts)
            case .failure(_):
                print("Error fetching data")
                self.casts.send([Cast]())
            }
        }
    }
}
