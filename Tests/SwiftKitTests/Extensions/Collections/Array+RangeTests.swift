//
//  Array_RangeTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-06-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftKit

class Array_RangeTests: QuickSpec {
    
    override func spec() {
        
        describe("array with int range") {
            
            it("handles small step size") {
                let result = Array(0...10, stepSize: 1)
                expect(result).to(equal([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
            }
            
            it("handles larger step size") {
                let result = Array(0...10, stepSize: 3)
                expect(result).to(equal([0, 3, 6, 9]))
            }
        }
        
        describe("array with double range") {
            
            it("handles small step size") {
                let result = Array(0.0...10.0, stepSize: 1.0)
                expect(result).to(equal([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
            }
            
            it("handles decimal step size") {
                let result = Array(0.0...1.0, stepSize: 0.1)
                expect(result).to(equal([0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]))
            }
            
            it("handles larger step size") {
                let result = Array(0.0...10.0, stepSize: 3.0)
                expect(result).to(equal([0, 3, 6, 9]))
            }
        }
    }
}
