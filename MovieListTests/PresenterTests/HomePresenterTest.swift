//
//  HomePresenterTest.swift
//  MovieListTests
//
//  Created by ndyyy on 04/02/24.
//
//
import XCTest
@testable import MovieList

final class HomePresenterTest: XCTestCase {
    var presenter: HomePresenter!
    var view = MockHomeView()
    var interactor = MockHomeInteractor()
    var router = MockHomeRouter()
    
    let movies = [
        Movie(id: 1, name: "movie name", type: .documentary, status: .running, averageRuntime: 90, summary: "this is summary", rating: .init(average: 9.4), schedule: .init(time: .t2100, days: [.monday, .tuesday]), genres: [.anime, .comedy], image: Image(medium: "hai", original: "hai")),
        Movie(id: 2, name: "movie name", type: .documentary, status: .running, averageRuntime: 90, summary: "this is summary", rating: .init(average: 9.4), schedule: .init(time: .t2100, days: [.monday, .tuesday]), genres: [.anime, .comedy], image: Image(medium: "hai", original: "hai")),
        Movie(id: 3, name: "movie name", type: .documentary, status: .running, averageRuntime: 90, summary: "this is summary", rating: .init(average: 9.4), schedule: .init(time: .t2100, days: [.monday, .tuesday]), genres: [.anime, .comedy], image: Image(medium: "hai", original: "hai"))
    ]
    
    override func setUp() {
        presenter = HomePresenter()
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
    }
    
    func test_presenter_withDummyMovies_shouldCallFetchedMovies() {
        presenter.fetchedMovies(movies)
        XCTAssertTrue(view.isFetchedChecker)
    }
    
    func test_presenter_withFetchedMovies_shouldNotEmpty() {
        let expectation = XCTestExpectation(description: "fetchMovies from Interactor")
        interactor.expectation = expectation
        presenter.viewDidLoad()
    
        wait(for: [expectation], timeout: 3)
        XCTAssertNotEqual(presenter.movies.count, 0)
    }
    
    func test_presenter_withTappedMovie_shouldPushToDetailScreen() {
        presenter.movies = movies
        presenter.onTappedMovie(with: 0)
        XCTAssertTrue(router.isPushToDetailIsCalled)
    }
}
