//
//  StringExtensionTest.swift
//  MovieListTests
//
//  Created by ndyyy on 05/02/24.
//

import XCTest
@testable import MovieList

final class StringExtensionTest: XCTestCase {
    func test_ConvertHTMLToAttributedString() {
        let html = "<p>hello world</p>"
        let attributedString = html.convertHTMLToAttributedString()
        XCTAssertNotNil(attributedString)
    }
    
    func test_ConvertHTMLToAttributedString_withEmptyString() {
        let html = ""
        let attributedString = html.convertHTMLToAttributedString()
        XCTAssertEqual(attributedString?.length, 0)
    }
    
    func test_ConvertHTMLToAttributedString_withNilString() {
        let html: String? = nil
        let attributedString = html?.convertHTMLToAttributedString()
        XCTAssertNil(attributedString)
    }
    
    func test_boldLabelWithLength() {
        let string = "hello: world"
        let attributedString = string.boldLabelWithLength()
        let font = attributedString.attribute(.font, at: 0, effectiveRange: nil) as! UIFont
        XCTAssertEqual(font, UIFont.boldSystemFont(ofSize: 16))
    }
}
