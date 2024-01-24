//
//  MovieDataSourceProtocol.swift
//  MVVM-MovieList
//
//  Created by ndyyy on 24/01/24.
//

import Foundation

protocol MovieDataSourceProtocol {
    func getMovie() async -> Result<[Movie], Error>
}
