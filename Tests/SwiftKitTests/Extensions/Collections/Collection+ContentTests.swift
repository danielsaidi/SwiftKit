//
//  Collection+ContentTests.swift
//  SwiftKitTest
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class Collection_ContentTests: QuickSpec {
    
    override func spec() {
        
        describe("Arrays") {
            
            it("does have content when not empty") {
                let value = ["whatever"]
                expect(value.hasContent).to(beTrue())
            }
            
            it("does not have content when empty") {
                let value = [String]()
                expect(value.hasContent).to(beFalse())
            }
        }
    }
}
