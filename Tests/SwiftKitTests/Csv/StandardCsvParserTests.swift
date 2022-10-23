//
//  StandardCsvParserTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2018-10-23.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftKit
import XCTest

class StandardCsvParserTests: XCTestCase {

    let parser = StandardCsvParser()

    func testCanParseSemicolonSeparatedString() {
        let result = parser.parseCsvString("foo;bar;baz\nenough", componentSeparator: ";")
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0], ["foo", "bar", "baz"])
        XCTAssertEqual(result[1], ["enough"])
    }

    func testCanParseCommaSeparatedString() {
        let result = parser.parseCsvString("a,b,c", componentSeparator: ",")
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result[0], ["a", "b", "c"])
    }

    func testTrimsComponents() {
        let result = parser.parseCsvString(" a , b , c ", componentSeparator: ",")
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result[0], ["a", "b", "c"])
    }

    func testIncludesEmptyComponents() {
        let result = parser.parseCsvString(" a ,  , c ", componentSeparator: ",")
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result[0], ["a", "", "c"])
    }
}
