//
//  IntTests.swift
//  wallabag
//

import XCTest
@testable import wallabag

class IntTests: XCTestCase {

    func testReadingTime() {
        XCTAssertEqual("01:00", 1.readingTime)
        XCTAssertEqual("02:00", 2.readingTime)
    }
}
