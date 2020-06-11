//
//  Collection+DistinctTests.swift
//  SwiftKitTest
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class Collection_DistinctTests: QuickSpec {
    
    override func spec() {
        
        describe("distinct") {
            
            it("remove all duplicated and preserves sorting order") {
                let array = [1, 1, 1, 2, 2, 3, 1, 2, 3, 1, 1, 1, 3]
                let arrayUnique = array.distinct()
                expect(arrayUnique).to(equal([1, 2, 3]))
            }
            
        }
    }
}
