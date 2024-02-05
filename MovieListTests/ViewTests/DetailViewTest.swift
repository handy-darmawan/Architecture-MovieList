//
//  DetailViewTest.swift
//  MovieListTests
//
//  Created by ndyyy on 05/02/24.
//

import XCTest
@testable import MovieList

final class DetailViewTest: XCTestCase {
    var view: DetailViewController!
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
        super.setUp()
        view = DetailViewController()
        view.loadViewIfNeeded()
        view.presenter = presenter
        presenter.view = view
    }

    func test_view_withFetchedMovies_shouldSetParameter() {
        view.fetchedMovie(movie)
        
        XCTAssertEqual(view.descriptionView.titleLabel.text, "The Simpsons")
        XCTAssertEqual(view.showInfoView.statusLabel.text , "Status : Running")
    }
}
