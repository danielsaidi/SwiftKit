//
//  String+ReplaceTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2016-12-13.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class String_ReplaceTests: QuickSpec {
    
    override func spec() {
        
        describe("replacing string with another string") {
            
            let string = "Hello, world!"
            
            it("does not replace anything if no match was found") {
                expect(string.replacing("World", with: "you")).to(equal(string))
                expect(string.replacing("World", with: "you", caseSensitive: true)).to(equal(string))
                expect(string.replacing("Earth", with: "you", caseSensitive: false)).to(equal(string))
            }
            
            it("can perform case-sensitive replace") {
                expect(string.replacing("world", with: "you")).to(equal("Hello, you!"))
                expect(string.replacing("world", with: "you", caseSensitive: true)).to(equal("Hello, you!"))
            }
            
            it("can perform case-insensitive replace") {
                expect(string.replacing("World", with: "you", caseSensitive: false)).to(equal("Hello, you!"))
                expect(string.replacing("world", with: "you", caseSensitive: false)).to(equal("Hello, you!"))
            }
        }
    }
}
