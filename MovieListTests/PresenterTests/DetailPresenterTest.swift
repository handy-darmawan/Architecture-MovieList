//
//  DetailPresenterTest.swift
//  MovieListTests
//
//  Created by ndyyy on 05/02/24.
//

import XCTest
@testable import MovieList

final class DetailPresenterTest: XCTestCase {
    var presenter: MockDetailPresenter!
    var interactor: MockDetailInteractor!
    var view = MockDetailView()
    
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
        super.setUp()
        presenter = MockDetailPresenter()
        interactor = MockDetailInteractor(for: movie)
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        
    }
    
    func test_presenter_withViewDidLoad_shouldFillCasts() {
        let expectation = XCTestExpectation(description: "fetch cast from interactor")
        presenter.expectation = expectation
        presenter.viewDidLoad()
        
        wait(for: [expectation], timeout: 3)
        XCTAssertNotEqual(presenter.getCasts().count, 0)
    }
    
}
