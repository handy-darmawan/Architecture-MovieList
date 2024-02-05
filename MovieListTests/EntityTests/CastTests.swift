//
//  CastTests.swift
//  MovieListTests
//
//  Created by ndyyy on 04/02/24.
//

import XCTest
@testable import MovieList

final class CastTests: XCTestCase {
    func test_castModel_withInitialization_shouldNotEmptyOrNull() {
        let cast = Cast(person: .init(id: 1, name: "names", image: .init(medium: "hai", original: "hai")))
        
        XCTAssertEqual(cast.person.name, "names")
        XCTAssertEqual(cast.person.id, 1)
    }
}
