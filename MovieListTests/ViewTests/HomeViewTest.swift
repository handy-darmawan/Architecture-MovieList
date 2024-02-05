//
//  HomeViewTest.swift
//  MovieListTests
//
//  Created by ndyyy on 03/02/24.
//

import XCTest
@testable import MovieList

final class HomeViewTest: XCTestCase {

    var view: HomeViewController!
    var presenter = MockHomePresenter()
    
    let movies = [
                Movie(id: 1, name: "movie name", type: .documentary, status: .running, averageRuntime: 90, summary: "this is summary", rating: .init(average: 9.4), schedule: .init(time: .t2100, days: [.monday, .tuesday]), genres: [.anime, .comedy], image: Image(medium: "hai", original: "hai")),
                Movie(id: 2, name: "movie name", type: .documentary, status: .running, averageRuntime: 90, summary: "this is summary", rating: .init(average: 9.4), schedule: .init(time: .t2100, days: [.monday, .tuesday]), genres: [.anime, .comedy], image: Image(medium: "hai", original: "hai")),
                Movie(id: 3, name: "movie name", type: .documentary, status: .running, averageRuntime: 90, summary: "this is summary", rating: .init(average: 9.4), schedule: .init(time: .t2100, days: [.monday, .tuesday]), genres: [.anime, .comedy], image: Image(medium: "hai", original: "hai"))
            ]
    
    override func setUp() {
        view = HomeViewController()
        view.presenter = presenter
        presenter.view = view
    }
    
    func test_view_withViewDidLoad_shouldCalled() {
        view.viewDidLoad()
        XCTAssertTrue(presenter.isViewDidLoaded)
    }
}
