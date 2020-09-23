//
//  Numeric+ConversionsTests.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import CoreGraphics
import Quick
import Nimble
import SwiftKit

class Numeric_ConversionsTests: QuickSpec {
    
    override func spec() {
        
        describe("cg float") {
            
            it("can be converted to other formats") {
                let value: CGFloat = 123.456
                expect(value.toDouble()).to(equal(123.456))
                expect(value.toFloat()).to(equal(123.456))
                expect(value.toInt()).to(equal(123))
            }
        }
        
        describe("double") {
            
            it("can be converted to other formats") {
                let value: Double = 123.456
                expect(value.toCGFloat()).to(equal(123.456))
                expect(value.toFloat()).to(equal(123.456))
                expect(value.toInt()).to(equal(123))
            }
        }
        
        describe("float") {
            
            it("can be converted to other formats") {
                let value: Float = 123.456
                expect(value.toCGFloat()).to(beCloseTo(123.456))
                expect(value.toDouble()).to(beCloseTo(123.456))
                expect(value.toInt()).to(equal(123))
            }
        }
        
        describe("int") {
            
            it("can be converted to other formats") {
                let value: Int = 123
                expect(value.toCGFloat()).to(equal(123.000))
                expect(value.toDouble()).to(equal(123.000))
                expect(value.toFloat()).to(equal(123.000))
            }
        }
    }
}
