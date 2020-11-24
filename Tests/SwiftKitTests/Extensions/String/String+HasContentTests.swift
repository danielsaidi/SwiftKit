//
//  String+HasContentTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-06-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class String_HasContentTests: QuickSpec {
    
    override func spec() {
        
        describe("has content") {
            
            it("is false if string is empty") {
                expect("".hasContent).to(beFalse())
            }
            
            it("is true if string is not empty") {
                expect(" ".hasContent).to(beTrue())
            }
        }
        
        describe("has trimmed content") {
            
            it("is false if string is empty") {
                expect("".hasTrimmedContent).to(beFalse())
            }
            
            it("is false if trimmed string is empty") {
                expect(" ".hasTrimmedContent).to(beFalse())
            }
            
            it("is true if trimmed string is not empty") {
                expect(" . ".hasTrimmedContent).to(beTrue())
            }
        }
    }
}
