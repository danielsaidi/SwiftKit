//
//  NumberFormatter+UtilTests.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2022-10-19.
//  Copyright © 2012 Daniel Saidi. All rights reserved.
//

import SwiftKit
import XCTest

class NumberFormatter_UtilTests: XCTestCase {

    func testStringForDoubleReturnsValidResult() {
        let value = 0.09156
        let formatter = NumberFormatter.percent(decimals: 2)
        let result = formatter.string(for: value)
        XCTAssertEqual(result, "9.16%")
    }

    func testStringForIntReturnsValidResult() {
        let value: Int = 9
        let formatter = NumberFormatter.percent(decimals: 2)
        let result = formatter.string(for: value)
        XCTAssertEqual(result, "900.00%")
    }
}
