//
//  MovieRepositoryTest.swift
//  MovieListTests
//
//  Created by ndyyy on 06/02/24.
//

import XCTest
@testable import MovieList

final class MovieRepositoryTest: XCTestCase {
    private let movieDataSource: MockMovieDataSource = MockMovieDataSource()
    let successData: Result<[Movie], Error>  = .success(
        [Movie(
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
        )]
    )
    
    func test_castRepository_withOneData_shouldSuccess() {
        movieDataSource.expectedResult = successData
        
        Task {
            await movieDataSource.getMovie { movie in
                switch movie {
                case .success(let movieData):
                    XCTAssertFalse(movieData.isEmpty)
                    XCTAssertEqual(movieData.first?.name, "The Simpsons")
               case .failure(_):
                    XCTFail("should not fail")
                }
            }
        }
    }
    
    func test_castRepository_withOneData_shouldFail() {
        movieDataSource.expectedResult = .failure(NSError(domain: "domain", code: 1, userInfo: ["error": "error"]))
        
        Task {
            await movieDataSource.getMovie { movie in
                switch movie {
                case .success(_):
                    XCTFail("should not success")
               case .failure(let error as NSError):
                    XCTAssertEqual(error.code, 1)
                }
            }
        }
    }
}
