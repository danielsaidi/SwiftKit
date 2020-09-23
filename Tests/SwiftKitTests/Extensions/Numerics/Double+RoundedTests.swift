//
//  Double_RoundedTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-06-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftKit

class Double_RoundedTests: QuickSpec {
    
    override func spec() {
        
        describe("rounded with decimals") {
            
            func result(for value: Double, _ decimals: Int) -> Double {
                value.roundedWithDecimals(decimals)
            }
            
            it("handles various decimals") {
                let value = 1.23456789
                expect(result(for: value, 0)).to(equal(1))
                expect(result(for: value, 1)).to(equal(1.2))
                expect(result(for: value, 2)).to(equal(1.23))
                expect(result(for: value, 3)).to(equal(1.235))
            }
        }
        
        describe("rounded with precision") {
            
            func result(for value: Double, _ precision: Double) -> Double {
                value.roundedWithPrecision(from: precision)
            }
            
            it("handles various decimals") {
                let value = 1.23456789
                expect(result(for: value, 1)).to(equal(1))
                expect(result(for: value, 1.2)).to(equal(1.2))
                expect(result(for: value, 1.23)).to(equal(1.23))
            }
            
            it("fails for higher precision") {
                let value = 1.23456789
                expect(result(for: value, 1.234)).to(equal(2.468))
            }
        }
    }
}
