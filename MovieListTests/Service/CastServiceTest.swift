//
//  CastServiceTest.swift
//  MovieListTests
//
//  Created by ndyyy on 05/02/24.
//

import XCTest
@testable import MovieList

final class CastServiceTest: XCTestCase {
    var castService: CastService!
    var fetchedCasts = [Cast]()
    
    override func setUp() {
        castService = CastService()
    }
    
    func test_movieService_withFetchMovies_shouldNotEmpty() {
        let expectation = XCTestExpectation(description: "fetchMovies from API")
        
        Task {
            await castService.fetchCast(id: 1) { [weak self] casts in
                guard let self = self else { return }
                fetchedCasts = casts
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 3)
        XCTAssertNotEqual(fetchedCasts.count, 0)
    }
}
