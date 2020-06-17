//
//  Comparable+ClosestTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class Comparable_ClosestTests: QuickSpec {
    
    override func spec() {
        
        describe("closest in array") {
            
            it("returns nil for empty array") {
                expect(5.closest(in: [], preferred: .greater)).to(beNil())
            }
            
            it("returns value itself if it exists in the collection") {
                expect(5.closest(in: [3, 4, 5], preferred: .greater)).to(equal(5))
                expect(5.closest(in: [3, 4, 5], preferred: .smaller)).to(equal(5))
            }
            
            context("when greater is preferred") {
                
                it("returns existing greater value") {
                    expect(5.closest(in: [6, -10, -1], preferred: .greater)).to(equal(6))
                }
                
                it("returns existing smaller value if greater value doesn't exist") {
                    expect(5.closest(in: [-10, -1], preferred: .greater)).to(equal(-1))
                }
            }
            
            context("when smaller is preferred") {
                
                it("returns existing smaller value") {
                    expect(5.closest(in: [6, -10, -1], preferred: .smaller)).to(equal(-1))
                }
                
                it("returns existing greater value if smaller value doesn't exist") {
                    expect(5.closest(in: [6, 10], preferred: .smaller)).to(equal(6))
                }
            }
        }
    }
}
