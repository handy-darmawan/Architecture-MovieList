//
//  HomeInteractorTest.swift
//  MovieListTests
//
//  Created by ndyyy on 05/02/24.
//

import XCTest
@testable import MovieList

final class HomeInteractorTest: XCTestCase {
    var interactor: HomeInteractor!
    var presenter = MockHomePresenter()
    
    override func setUp() {
        interactor = HomeInteractor()
        interactor.presenter = presenter
    }
    
    func test_interactor_withFetchMovies_shouldNotEmpty() {
        let expectation = XCTestExpectation(description: "fetchMovies from services")
        presenter.expectation = expectation
        interactor.fetchMovies()
        
        wait(for: [expectation], timeout: 3)
        XCTAssertNotEqual(presenter.movies.count, 0)
    }
}


