//
//  CastRepositoryTest.swift
//  MovieListTests
//
//  Created by ndyyy on 06/02/24.
//

import XCTest
@testable import MovieList

final class CastRepositoryTest: XCTestCase {
    private let castDataSource: MockCastDataSource = MockCastDataSource()
    let successData: Result<[Cast], Error>  = .success([Cast(
        id: 1,
        name: "John Doe",
        mediumImage: URL(
            string: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg"
        )!
    )])
    
    func test_castRepository_withOneData_shouldSuccess() {
        castDataSource.expectedResult = successData
        
        Task {
            await castDataSource.getCast(movieID: 1) { cast in
                switch cast {
                case .success(let castData):
                    XCTAssertFalse(castData.isEmpty)
                    XCTAssertEqual(castData.first?.name, "John Doe")
               case .failure(_):
                    XCTFail("should not fail")
                }
            }
        }
    }
    
    func test_castRepository_withEmptyData_shouldFail() {
        castDataSource.expectedResult = .failure(NSError(domain: "domain", code: 1, userInfo: ["error": "error"]))
        
        Task {
            await castDataSource.getCast(movieID: 1) { cast in
                switch cast {
                case .success(_):
                    XCTFail("should not success")
                case .failure(let error as NSError):
                    XCTAssertEqual(error.code, 1)
                }
            }
        }
    }
}
