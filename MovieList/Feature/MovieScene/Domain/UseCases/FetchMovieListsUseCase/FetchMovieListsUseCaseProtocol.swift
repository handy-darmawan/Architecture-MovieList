//
//  FetchMovieListsUseCaseProtocol.swift
//  MovieList
//
//  Created by ndyyy on 25/01/24.
//

import Foundation

protocol FetchMovieListsUseCaseProtocol {
    func execute(handler: @escaping (Result<[Movie], Error>) -> Void) async
}
