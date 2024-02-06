//
//  MovieModelTest.swift
//  MovieListTests
//
//  Created by ndyyy on 06/02/24.
//

import XCTest
@testable import MovieList

final class MovieModelTest: XCTestCase {
    var movie = Movie(
        id: 1,
        name: "The Simpsons",
        type: .animation,
        status: .running,
        averageRuntime: 30,
        summary: "The Simpsons is an American animated sitcom created by Matt Groening for the Fox Broadcasting Company.",
        rating: 8.7,
        time: .t2000,
        days: [.sunday, .monday],
        genres: [.comedy, .family],
        mediumImage: URL(
            string: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg")!
    )
    
    func test_movieModel_shouldSuccess() {
        XCTAssertEqual(movie.id, 1)
        XCTAssertEqual(movie.name, "The Simpsons")
        XCTAssertEqual(movie.mediumImage, URL(string: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg")!)
    }
    
    func test_movieModel_shouldFail() {
        XCTAssertNotEqual(movie.id, 2)
        XCTAssertNotEqual(movie.name, "The Simpsonss")
        XCTAssertNotEqual(movie.mediumImage, URL(string: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627")!)
    }
}
