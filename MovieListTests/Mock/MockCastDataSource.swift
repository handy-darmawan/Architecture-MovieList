//
//  MockCastDataSource.swift
//  MovieListTests
//
//  Created by ndyyy on 06/02/24.
//

import XCTest
@testable import MovieList


class MockCastDataSource: CastDataSourceProtocol {
    var expectedResult: Result<[Cast], Error>!
    
    func getCast(movieID: Int, completion: @escaping (Result<[Cast], Error>) -> Void) async {
        completion(expectedResult)
    }
}
