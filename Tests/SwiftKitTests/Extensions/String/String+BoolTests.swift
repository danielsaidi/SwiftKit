//
//  String+BoolTests.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-11-02.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class String_BoolTests: QuickSpec {
    
    override func spec() {
        
        describe("bool value") {
            
            func result(for string: String) -> Bool {
                string.boolValue
            }
            
            it("is valid for many different true expressions") {
                let expected = ["YES", "yes", "1"]
                expected.forEach {
                    expect(result(for: $0)).to(beTrue())
                }
            }
            
            it("is valid for many different false expressions") {
                let expected = ["NO", "no", "0"]
                expected.forEach {
                    expect(result(for: $0)).to(beFalse())
                }
            }
        }
    }
}
