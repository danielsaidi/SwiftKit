//
//  String+UrlEncodeTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class String_UrlEncodeTests: QuickSpec {
    
    override func spec() {
        
        describe("url encoded string") {
            
            it("handles space") {
                expect("foo bar".urlEncoded()).to(equal("foo%20bar"))
            }
            
            it("handles question mark") {
                expect("?foo=bar".urlEncoded()).to(equal("%3Ffoo=bar"))
            }
            
            it("handles ampersand") {
                expect("foo=bar&baz=123".urlEncoded()).to(equal("foo=bar%26baz=123"))
            }
            
            it("handles swedish chars") {
                expect("åäöÅÄÖ".urlEncoded()).to(equal("%C3%A5%C3%A4%C3%B6%C3%85%C3%84%C3%96"))
            }
        }
    }
}
