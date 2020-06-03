//
//  String+ContainsTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2016-12-13.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class String_ContainsTests: QuickSpec {
    
    override func spec() {
        
        describe("checking if string contains another string") {
            
            context("with case-sensitive check") {
                
                it("finds existing string") {
                    let result = "foo".contains("foo", caseSensitive: true)
                    expect(result).to(beTrue())
                }
                
                it("does not find non-existing string") {
                    let result = "foo".contains("foO", caseSensitive: true)
                    expect(result).to(beFalse())
                }
            }
            
            context("with case-insensitive check") {
                
                it("finds existing string case-sensitively") {
                    let result = "foo".contains("foo", caseSensitive: false)
                    expect(result).to(beTrue())
                }
                
                it("finds existing string case-insensitively") {
                    let result = "foo".contains("foO", caseSensitive: false)
                    expect(result).to(beTrue())
                }
                
                it("does not find non-existing string case-sensitively") {
                    let result = "foo".contains("foot", caseSensitive: false)
                    expect(result).to(beFalse())
                }
            }
        }
    }
}
