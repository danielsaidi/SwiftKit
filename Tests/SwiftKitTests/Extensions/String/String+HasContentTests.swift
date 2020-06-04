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
    }
}
