//
//  MovieRepositoryProtocol.swift
//  MVVM-MovieList
//
//  Created by ndyyy on 23/01/24.
//

import Foundation

protocol MovieRepositoryProtocol {
    func getMovie(handler: @escaping (Result<[Movie], Error>) -> Void) async
}
