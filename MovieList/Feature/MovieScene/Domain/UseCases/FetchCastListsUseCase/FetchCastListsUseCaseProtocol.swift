//
//  FetchCastListsUseCaseProtocol.swift
//  MovieList
//
//  Created by ndyyy on 25/01/24.
//

import Foundation

protocol FetchCastListsUseCaseProtocol {
    func execute(movieID: Int, handler: @escaping (Result<[Cast], Error>) -> Void) async
}
