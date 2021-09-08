//
//  String+SplitTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2021-09-08.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class String_SplitTests: QuickSpec {
    
    override func spec() {
        
        describe("split by separators") {
            
            it("splits on all provided separators") {
                let string = "I.Love,Swift!Very much"
                let result = string.split(by: [".", ",", "!"])
                let expected = ["I", "Love", "Swift", "Very much"]
                expect(result).to(equal(expected))
            }
        }
    }
}
