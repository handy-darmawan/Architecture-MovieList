//
//  MovieServiceTest.swift
//  MovieListTests
//
//  Created by ndyyy on 05/02/24.
//

import XCTest
@testable import MovieList

final class MovieServiceTest: XCTestCase {
    var movieService: MovieService!
    var fetchedMovies = [Movie]()
    
    override func setUp() {
        movieService = MovieService()
    }
    
    func test_movieService_withFetchMovies_shouldNotEmpty() {
        let expectation = XCTestExpectation(description: "fetchMovies from API")
        
        Task {
            await movieService.fetchMovies { [weak self] movies in
                guard let self = self else { return }
                fetchedMovies = movies
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 3)
        XCTAssertNotEqual(fetchedMovies.count, 0)
    }
}
