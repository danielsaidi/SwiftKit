//
//  Comparable+LimitTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2018-10-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class Comparable_LimitTests: QuickSpec {
    
    override func spec() {
        
        describe("limiting comparable") {
            
            it("doesn't change value in range") {
                var value = 5
                value.limit(to: 0...10)
                expect(value).to(equal(5))
            }
            
            it("caps to min if original value is too low") {
                var value = 5
                value.limit(to: 6...10)
                expect(value).to(equal(6))
            }
            
            it("caps tp max if original value is too great") {
                var value = 5
                value.limit(to: 0...4)
                expect(value).to(equal(4))
            }
        }
        
        describe("limited result for comparable") {
            
            it("is original value in range") {
                expect(5.limited(to: 0...10)).to(equal(5))
            }
            
            it("is min value if original value is too low") {
                expect((-1).limited(to: 0...10)).to(equal(0))
            }
            
            it("is max value if original value is too great") {
                expect(11.limited(to: 0...10)).to(equal(10))
            }
        }
    }
}
