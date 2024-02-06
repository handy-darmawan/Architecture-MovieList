//
//  CastModelTest.swift
//  MovieListTests
//
//  Created by ndyyy on 06/02/24.
//

import XCTest
@testable import MovieList

final class CastModelTest: XCTestCase {
    var cast = Cast(
        id: 1,
        name: "John Doe",
        mediumImage: URL(
            string: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg"
        )!
    )
    
    func test_castModel_shouldSuccess() {
        XCTAssertEqual(cast.id, 1)
        XCTAssertEqual(cast.name, "John Doe")
        XCTAssertEqual(cast.mediumImage, URL(string: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg")!)
    }
    
    func test_castModel_shouldFail() {
        XCTAssertNotEqual(cast.id, 2)
        XCTAssertNotEqual(cast.name, "John")
        XCTAssertNotEqual(cast.mediumImage, URL(string: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627")!)
    }
}
