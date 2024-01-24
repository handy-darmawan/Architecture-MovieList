//
//  CastRepositoryProtocol.swift
//  MVVM-MovieList
//
//  Created by ndyyy on 23/01/24.
//

import Foundation

protocol CastRepositoryProtocol {
    func getCast(movieID: Int, handler: @escaping (Result<[Cast], Error>) -> Void) async
}
