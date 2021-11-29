//
//  String+ParagraphTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2021-11-29.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class String_ParagraphTests: QuickSpec {
    
    override func spec() {
        
        let none = "foo bar baz"
        let single = "foo\nbar baz"
        let multi = "foo\nbar\rbaz"
        
        describe("index of current paragraph") {
            
            func result(for string: String, from location: UInt) -> UInt {
                string.findIndexOfCurrentParagraph(from: location)
            }
            
            it("is correct for empty string") {
                expect(result(for: "", from: 0)).to(equal(0))
                expect(result(for: "", from: 20)).to(equal(0))
            }
            
            it("is correct for string with no previous paragraph") {
                expect(result(for: none, from: 0)).to(equal(0))
                expect(result(for: none, from: 10)).to(equal(0))
                expect(result(for: none, from: 20)).to(equal(0))
            }
            
            it("is correct for string with single previous paragraph") {
                expect(result(for: single, from: 0)).to(equal(0))
                expect(result(for: single, from: 5)).to(equal(4))
                expect(result(for: single, from: 10)).to(equal(4))
            }
            
            it("is correct for string with multiple previous paragraphs") {
                expect(result(for: multi, from: 0)).to(equal(0))
                expect(result(for: multi, from: 5)).to(equal(4))
                expect(result(for: multi, from: 10)).to(equal(8))
            }
        }
        
        describe("index of next paragraph") {
            
            func result(for string: String, from location: UInt) -> UInt {
                string.findIndexOfNextParagraph(from: location)
            }
            
            it("is correct for empty string") {
                expect(result(for: "", from: 0)).to(equal(0))
                expect(result(for: "", from: 20)).to(equal(0))
            }
            
            it("is correct for string with no next paragraph") {
                expect(result(for: none, from: 0)).to(equal(0))
                expect(result(for: none, from: 10)).to(equal(0))
                expect(result(for: none, from: 20)).to(equal(0))
            }
            
            it("is correct for string with single next paragraph") {
                expect(result(for: single, from: 0)).to(equal(4))
                expect(result(for: single, from: 5)).to(equal(4))
                expect(result(for: single, from: 10)).to(equal(4))
            }
            
            it("is correct for string with multiple next paragraphs") {
                expect(result(for: multi, from: 0)).to(equal(4))
                expect(result(for: multi, from: 5)).to(equal(8))
                expect(result(for: multi, from: 10)).to(equal(8))
            }
        }
    }
}
