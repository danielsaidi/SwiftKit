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

class DispatchQueue_AsyncTests: QuickSpec {
    
    override func spec() {
    
        let queue = DispatchQueue.main
        
        describe("async after time interval") {
            
            it("supports delaying for custom time interval") {
                var count = 0
                queue.asyncAfter(.microseconds(1)) { count += 1 }
                queue.asyncAfter(.milliseconds(1)) { count += 1 }
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
            
            it("supports concatenating results") {
                var result = ""
                queue.async(
                    execute: { "Hello"},
                    then: { result = $0 + ", world!" },
                    on: .main
                )
                expect(result).toEventually(equal("Hello, world!"))
            }
        }
    }
}
