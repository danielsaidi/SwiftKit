//
//  Date+AddRemoveTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

import Quick
import Nimble
import SwiftKit

class DateAddRemoveTests: QuickSpec {
    
    override func spec() {
        
        describe("adding days") {
            
            it("returns correct date") {
                let date = Date(timeIntervalSince1970: 0)
                let result = date.adding(days: 3).timeIntervalSince1970
                expect(result).to(equal(3 * 60 * 60 * 24))
            }
        }
        
        describe("adding hours") {
            
            it("returns correct date") {
                let date = Date(timeIntervalSince1970: 0)
                let result = date.adding(hours: 3).timeIntervalSince1970
                expect(result).to(equal(3 * 60 * 60))
            }
        }
        
        describe("adding minutes") {
            
            it("returns correct date") {
                let date = Date(timeIntervalSince1970: 0)
                let result = date.adding(minutes: 3).timeIntervalSince1970
                expect(result).to(equal(3 * 60))
            }
        }
        
        describe("adding seconds") {
            
            it("returns correct date") {
                let date = Date(timeIntervalSince1970: 0)
                let result = date.adding(seconds: 3).timeIntervalSince1970
                expect(result).to(equal(3))
            }
        }
        
        describe("removing days") {
            
            it("returns correct date") {
                let date = Date(timeIntervalSince1970: 3 * 60 * 60 * 24)
                let result = date.removing(days: 3).timeIntervalSince1970
                expect(result).to(equal(0))
            }
        }
        
        describe("removing hours") {
            
            it("returns correct date") {
                let date = Date(timeIntervalSince1970: 3 * 60 * 60)
                let result = date.removing(hours: 3).timeIntervalSince1970
                expect(result).to(equal(0))
            }
        }
        
        describe("removing minutes") {
            
            it("returns correct date") {
                let date = Date(timeIntervalSince1970: 3 * 60)
                let result = date.removing(minutes: 3).timeIntervalSince1970
                expect(result).to(equal(0))
            }
        }
        
        describe("removing seconds") {
            
            it("returns correct date") {
                let date = Date(timeIntervalSince1970: 3)
                let result = date.removing(seconds: 3).timeIntervalSince1970
                expect(result).to(equal(0))
            }
        }
        
        describe("chaining operations") {
            
            it("returns correct date") {
                let date = Date(timeIntervalSince1970: 0)
                let result = date
                    .adding(days: 3)
                    .adding(hours: 2)
                    .removing(seconds: 15)
                    .timeIntervalSince1970
                let days: Double = 3 * 60 * 60 * 24
                let hours: Double = 2 * 60 * 60
                expect(result).to(equal(days + hours - 15))
            }
        }
    }
}
