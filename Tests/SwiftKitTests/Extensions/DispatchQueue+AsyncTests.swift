//
//  DispatchQueue+AsyncTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-06-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftKit

class DelayTests: QuickSpec {
    
    override func spec() {
    
        let queue = DispatchQueue.main
        
        describe("async after time interval") {
            
            it("supports delaying for custom time interval") {
                var count = 0
                queue.asyncAfter(interval: .microseconds(1)) { count += 1 }
                queue.asyncAfter(interval: .milliseconds(1)) { count += 1 }
                expect(count).toEventually(equal(2))
            }
        }
        
        describe("async then") {
            
            it("supports chaining void block") {
                var count = 0
                queue.async(execute: { count += 1 }, then: { count += 1 })
                expect(count).toEventually(equal(2))
            }
            
            it("supports chaining generic block") {
                var count = 0
                queue.async(execute: { 1 }, then: { count += $0 })
                expect(count).toEventually(equal(1))
            }
        }
    }
}
