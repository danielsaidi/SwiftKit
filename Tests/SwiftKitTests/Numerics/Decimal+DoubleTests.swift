//
//  Decimal_DoubleTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-06-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftKit

class Decimal_DoubleTests: QuickSpec {
    
    override func spec() {
        
        describe("double value") {
            
            func result(for value: Decimal) -> Double {
                value.doubleValue
            }
            
            it("handles various decimals") {
                expect(result(for: 1)).to(equal(1))
                expect(result(for: 1.2)).to(equal(1.2))
                expect(result(for: 1.23)).to(equal(1.23))
                expect(result(for: 1.234)).to(equal(1.234))
            }
        }
    }
}
