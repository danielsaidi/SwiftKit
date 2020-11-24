//
//  Optional+IsSetTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class Optional_HasValue: QuickSpec {
    
    override func spec() {
        
        describe("optional") {
            
            var value: String?
            
            beforeEach {
                value = nil
            }
            
            it("is set if not nil") {
                value = "value"
                expect(value.isSet).to(beTrue())
                expect(value.isNil).to(beFalse())
            }
            
            it("is not set if value is nil") {
                expect(value.isNil).to(beTrue())
                expect(value.isSet).to(beFalse())
            }
        }
    }
}
