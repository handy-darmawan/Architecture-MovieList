//
//  CastDataSourceProtocol.swift
//  MVVM-MovieList
//
//  Created by ndyyy on 24/01/24.
//

import Foundation

protocol CastDataSourceProtocol {
    func getCast(movieID: Int, completion: @escaping (Result<[Cast], Error>) -> Void) async
}
