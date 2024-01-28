//
//  FetchCastListsUseCase.swift
//  MovieList
//
//  Created by ndyyy on 25/01/24.
//

import Foundation

class FetchCastListsUseCase {
    private let castRepository: CastRepository = CastRepository()
    
    func execute(movieID: Int, handler: @escaping (Result<[Cast], Error>) -> Void) async {
        await castRepository.getCast(movieID: movieID, handler: handler)
    }
}
