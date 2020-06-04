//
//  String+Base64Tests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class String_Base64Tests: QuickSpec {
    
    override func spec() {
        
        describe("string base64") {
            
            it("encodes empty string") {
                let string = ""
                let result = string.base64Encoded()!
                expect(result).to(equal(""))
            }
            
            it("encodes and decodes regular string") {
                let string = "foo bar"
                let result = string.base64Encoded()!.base64Decoded()
                expect(result).to(equal(string))
            }
            
            it("encodes and decodes swedish chars") {
                let string = "ÅÄÖ åäö"
                let result = string.base64Encoded()!.base64Decoded()
                expect(result).to(equal(string))
            }
            
            it("encodes and decodes strange device name") {
                let string = "saaaandii ♡"
                let result = string.base64Encoded()!.base64Decoded()
                expect(result).to(equal(string))
            }
            
            it("encodes and decodes emojis") {
                let string = "😁😂😃"
                let result = string.base64Encoded()!.base64Decoded()
                expect(result).to(equal(string))
            }
            
        }
    }
}
