//
//  Numeric+FormatTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2015-11-15.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import CoreGraphics
import Foundation
import Quick
import Nimble
import SwiftKit

class Numeric_FormatTests: QuickSpec {
    
    override func spec() {
        
        describe("string with decimals") {
            
            let value: Double = 123.456789
            let values: [NumericStringRepresentable] = [
                value,
                CGFloat(value),
                Float(value)
            ]
            
            func result(for decimals: Int) -> [String] {
                values.map { $0.string(withDecimals: decimals) }
            }
            
            
            it("handles no decimals") {
                result(for: 0).forEach {
                    expect($0).to(equal("123"))
                }
            }
            
            it("handles one decimal") {
                result(for: 1).forEach {
                    expect($0).to(equal("123.5"))
                }
            }
            
            it("handles two decimals") {
                result(for: 2).forEach {
                    expect($0).to(equal("123.46"))
                }
            }
        }
    }
}
