//
//  MockMovieDataSource.swift
//  MovieListTests
//
//  Created by ndyyy on 06/02/24.
//

import XCTest
@testable import MovieList

class MockMovieDataSource: MovieDataSourceProtocol {
    var expectedResult: Result<[Movie], Error>!
    
    func getMovie(completion: @escaping (Result<[MovieList.Movie], Error>) -> Void) async {
        completion(expectedResult)
    }
}
