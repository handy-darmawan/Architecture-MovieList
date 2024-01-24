//
//  DetailViewModel.swift
//  MVVM-MovieList
//
//  Created by ndyyy on 25/01/24.
//

import UIKit
import Combine


class DetailViewModel {
    private let fetchCastUseCase: FetchCastListsUseCase
    
    init() {
        fetchCastUseCase = FetchCastListsUseCase()
    }
    
    //MARK: - Output
    var casts = CurrentValueSubject<[Cast], Never>([])
    
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
