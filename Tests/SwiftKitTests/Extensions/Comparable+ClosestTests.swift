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
            
            it("returns smaller value if preferred") {
                expect(5.closest(in: [6, -10, -1], preferred: .smaller)).to(equal(-1))
            }
            
            it("returns smaller value if preferred greater doesn't exist") {
                expect(5.closest(in: [-10, -1], preferred: .greater)).to(equal(-1))
            }
            
            it("returns greater value if preferred") {
                expect(5.closest(in: [6, -10, -1], preferred: .greater)).to(equal(6))
            }
            
            it("returns greater value if preferred smaller doesn't exist") {
                expect(5.closest(in: [6, 10], preferred: .smaller)).to(equal(6))
            }
        }
    }
}
