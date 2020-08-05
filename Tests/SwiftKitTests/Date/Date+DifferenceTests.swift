//
//  Date+DifferenceTests.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftKit

class Date_DifferenceTests: QuickSpec {
    
    override func spec() {
        
        describe("date") {
            
            it("can calculate year offset") {
                let date = Date(year: 2017, month: 02, day: 23, hour: 01, minute: 01, second: 01)!
                let oneAgo = Date(year: 2016, month: 02, day: 23, hour: 01, minute: 01, second: 01)!
                let twoAgo = Date(year: 2015, month: 02, day: 23, hour: 01, minute: 01, second: 01)!
                let inOne = Date(year: 2018, month: 02, day: 24, hour: 01, minute: 01, second: 01)!
                let inTwo = Date(year: 2019, month: 02, day: 24, hour: 01, minute: 01, second: 01)!
                
                expect(date.years(from: oneAgo)).to(equal(1))
                expect(date.years(from: twoAgo)).to(equal(2))
                expect(date.years(from: inOne)).to(equal(-1))
                expect(date.years(from: inTwo)).to(equal(-2))
            }
            
            it("can calculate month offset") {
                let date = Date(year: 2017, month: 02, day: 23, hour: 01, minute: 01, second: 01)!
                let oneAgo = Date(year: 2017, month: 01, day: 23, hour: 01, minute: 01, second: 01)!
                let twoAgo = Date(year: 2016, month: 12, day: 23, hour: 01, minute: 01, second: 01)!
                let inOne = Date(year: 2017, month: 03, day: 24, hour: 01, minute: 01, second: 01)!
                let inTwo = Date(year: 2017, month: 04, day: 24, hour: 01, minute: 01, second: 01)!
                let inTwelve = Date(year: 2018, month: 02, day: 24, hour: 01, minute: 01, second: 01)!
                
                expect(date.months(from: oneAgo)).to(equal(1))
                expect(date.months(from: twoAgo)).to(equal(2))
                expect(date.months(from: inOne)).to(equal(-1))
                expect(date.months(from: inTwo)).to(equal(-2))
                expect(date.months(from: inTwelve)).to(equal(-12))
            }
            
            it("can calculate week offset") {
                let date = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 01)!
                let same = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 01)!
                let oneAgo = Date(year: 2017, month: 01, day: 26, hour: 01, minute: 01, second: 01)!
                let twoAgo = Date(year: 2017, month: 01, day: 19, hour: 01, minute: 01, second: 01)!
                let inOne = Date(year: 2017, month: 02, day: 09, hour: 01, minute: 01, second: 01)!
                let inTwo = Date(year: 2017, month: 02, day: 16, hour: 01, minute: 01, second: 01)!
                
                expect(date.weeks(from: same)).to(equal(0))
                expect(date.weeks(from: oneAgo)).to(equal(1))
                expect(date.weeks(from: twoAgo)).to(equal(2))
                expect(date.weeks(from: inOne)).to(equal(-1))
                expect(date.weeks(from: inTwo)).to(equal(-2))
            }
            
            it("can calculate day offset") {
                let date = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 01)!
                let oneAgo = Date(year: 2017, month: 02, day: 01, hour: 01, minute: 01, second: 01)!
                let twoAgo = Date(year: 2017, month: 01, day: 31, hour: 01, minute: 01, second: 01)!
                let inOne = Date(year: 2017, month: 02, day: 03, hour: 01, minute: 01, second: 01)!
                let inTwo = Date(year: 2017, month: 02, day: 04, hour: 01, minute: 01, second: 01)!
                let inTwentyEight = Date(year: 2017, month: 03, day: 02, hour: 01, minute: 01, second: 01)!
                
                expect(date.days(from: oneAgo)).to(equal(1))
                expect(date.days(from: twoAgo)).to(equal(2))
                expect(date.days(from: inOne)).to(equal(-1))
                expect(date.days(from: inTwo)).to(equal(-2))
                expect(date.days(from: inTwentyEight)).to(equal(-28))
            }
            
            it("can calculate hour offset") {
                let date = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 01)!
                let oneAgo = Date(year: 2017, month: 02, day: 02, hour: 00, minute: 01, second: 01)!
                let twoAgo = Date(year: 2017, month: 02, day: 01, hour: 23, minute: 01, second: 01)!
                let inOne = Date(year: 2017, month: 02, day: 02, hour: 02, minute: 01, second: 01)!
                let inTwo = Date(year: 2017, month: 02, day: 02, hour: 03, minute: 01, second: 01)!
                let inTwentyFour = Date(year: 2017, month: 02, day: 03, hour: 01, minute: 01, second: 01)!
                
                expect(date.hours(from: oneAgo)).to(equal(1))
                expect(date.hours(from: twoAgo)).to(equal(2))
                expect(date.hours(from: inOne)).to(equal(-1))
                expect(date.hours(from: inTwo)).to(equal(-2))
                expect(date.hours(from: inTwentyFour)).to(equal(-24))
            }
            
            it("can calculate minute offset") {
                let date = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 01)!
                let oneAgo = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 00, second: 01)!
                let twoAgo = Date(year: 2017, month: 02, day: 02, hour: 00, minute: 59, second: 01)!
                let inOne = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 02, second: 01)!
                let inTwo = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 03, second: 01)!
                let inSixty = Date(year: 2017, month: 02, day: 02, hour: 02, minute: 01, second: 01)!
                
                expect(date.minutes(from: oneAgo)).to(equal(1))
                expect(date.minutes(from: twoAgo)).to(equal(2))
                expect(date.minutes(from: inOne)).to(equal(-1))
                expect(date.minutes(from: inTwo)).to(equal(-2))
                expect(date.minutes(from: inSixty)).to(equal(-60))
            }
            
            it("can calculate second offset") {
                let date = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 01)!
                let oneAgo = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 00)!
                let twoAgo = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 00, second: 59)!
                let inOne = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 02)!
                let inTwo = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 01, second: 03)!
                let inSixty = Date(year: 2017, month: 02, day: 02, hour: 01, minute: 02, second: 01)!
                
                expect(date.seconds(from: oneAgo)).to(equal(1))
                expect(date.seconds(from: twoAgo)).to(equal(2))
                expect(date.seconds(from: inOne)).to(equal(-1))
                expect(date.seconds(from: inTwo)).to(equal(-2))
                expect(date.seconds(from: inSixty)).to(equal(-60))
            }
        }
    }
}
