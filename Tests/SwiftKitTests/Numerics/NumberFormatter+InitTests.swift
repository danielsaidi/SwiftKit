//
//  NumberFormatter+InitTests.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2022-10-19.
//  Copyright © 2012 Daniel Saidi. All rights reserved.
//

import SwiftKit
import XCTest

class NumberFormatter_InitTests: XCTestCase {

    func testConvenienceInitializerUsesUsEnglishByDefault() {
        let formatter = NumberFormatter(numberStyle: .currency)
        XCTAssertEqual(formatter.locale.identifier, "en-US")
        XCTAssertEqual(formatter.numberStyle, .currency)
    }

    func testConvenienceInitializerCanEnforceFixedDecimals() {
        let formatter = NumberFormatter(numberStyle: .percent, fixedDecimals: 2)
        XCTAssertEqual(formatter.locale.identifier, "en-US")
        XCTAssertEqual(formatter.numberStyle, .percent)
        XCTAssertEqual(formatter.minimumFractionDigits, 2)
        XCTAssertEqual(formatter.maximumFractionDigits, 2)
    }

    func testConvenienceInstanceGeneratesValidDateStringForDollars() {
        let value = 123_456_789.123
        let formatter = NumberFormatter(numberStyle: .currency)
        let result = formatter.string(from: NSNumber(value: value))
        XCTAssertEqual(result, "$123,456,789.12")
    }

    func testConvenienceInstanceGeneratesValidDateStringForSwedishKrona() {
        let value = 123_456_789.123
        let locale = Locale(identifier: "sv-SE")
        let formatter = NumberFormatter(numberStyle: .currency, locale: locale)
        let result = formatter.string(from: NSNumber(value: value))
        XCTAssertEqual(result, "123 456 789,12 kr")
    }

    func testPercentFormatterGeneratesValidStringWithTwoDecimals() {
        let value = 0.09156
        let formatter = NumberFormatter.percent(decimals: 2)
        let result = formatter.string(from: NSNumber(value: value))
        XCTAssertEqual(result, "9.16%")
    }

    func testPercentFormatterGeneratesValidStringWithZeroDecimals() {
        let value = 0.09156
        let formatter = NumberFormatter.percent(decimals: 0)
        let result = formatter.string(from: NSNumber(value: value))
        XCTAssertEqual(result, "9%")
    }
}
