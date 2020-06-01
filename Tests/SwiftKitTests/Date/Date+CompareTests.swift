//
//  Date+CompareTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-05-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

import Quick
import Nimble
import SwiftKit

class DateComparingTests: QuickSpec {
    
    override func spec() {
        
        describe("comparing dates") {
            
            it("correctly compares if a date is before another") {
                let date1 = Date(timeIntervalSince1970: 0)
                let date2 = Date(timeIntervalSince1970: 1)
                expect(date1.isBefore(date2)).to(beTrue())
                expect(date2.isBefore(date1)).to(beFalse())
            }
            
            it("correctly compares if a date is after another") {
                let date1 = Date(timeIntervalSince1970: 0)
                let date2 = Date(timeIntervalSince1970: 1)
                expect(date1.isAfter(date2)).to(beFalse())
                expect(date2.isAfter(date1)).to(beTrue())
            }
            
            it("correctly compares if a date is same as another") {
                let date1 = Date(timeIntervalSince1970: 0)
                let date2 = Date(timeIntervalSince1970: 1)
                let date3 = Date(timeIntervalSince1970: 0)
                expect(date1.isSame(as: date2)).to(beFalse())
                expect(date1.isSame(as: date3)).to(beTrue())
            }
        }
    }
}
