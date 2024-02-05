//
//  MovieTests.swift
//  MovieListTests
//
//  Created by ndyyy on 04/02/24.
//

import XCTest
@testable import MovieList

final class MovieTests: XCTestCase {
    func test_movieModel_withInitialization_shouldNotEmptyOrNull() {
        let movie = Movie(id: 1, name: "movie name", type: .documentary, status: .running, averageRuntime: 90, summary: "this is summary", rating: .init(average: 9.4), schedule: .init(time: .t2100, days: [.monday, .tuesday]), genres: [.anime, .comedy], image: Image(medium: "hai", original: "hai"))
        
        XCTAssertEqual(movie.name, "movie name")
        XCTAssertEqual(movie.type, .documentary)
    }
}
