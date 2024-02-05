//
//  DetailInteractorTest.swift
//  MovieListTests
//
//  Created by ndyyy on 05/02/24.
//

import XCTest
@testable import MovieList

final class DetailInteractorTest: XCTestCase {
    var interactor: DetailInteractor!
    var presenter = MockDetailPresenter()
    
    let movie = Movie(
        id: 18,
        name: "The Simpsons",
        type: .animation,
        status: .running,
        averageRuntime: 199,
        summary: "hs",
        rating: .init(average: 1.2),
        schedule: .init(time: .t1200, days: [.monday, .saturday]),
        genres: [.adventure],
        image: Image(
            medium: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg",
            original: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg"
        )
    )
    
    override func setUp() {
        interactor = DetailInteractor(for: movie)
        interactor.presenter = presenter
    }
    
    func test_interactor_withFetchCasts_shouldNotEmpty() {
        let expectation = XCTestExpectation(description: "fetch cast from service")
        presenter.expectation = expectation
        interactor.fetchCast()
        
        wait(for: [expectation], timeout: 3)
        XCTAssertNotEqual(presenter.casts.count, 0)
    }
    
}
