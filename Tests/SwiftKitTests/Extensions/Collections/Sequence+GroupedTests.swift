//
//  Array+GroupTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2017-04-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class Array_GroupTests: QuickSpec {
    
    override func spec() {
        
        func getArray() -> [TestItem] {
            let obj1 = TestItem(name: "Foo", age: 10)
            let obj2 = TestItem(name: "Foo", age: 20)
            let obj3 = TestItem(name: "Bar", age: 20)
            return [obj1, obj2, obj3]
        }
        
        describe("grouping array") {
            
            it("can group by string") {
                let result = getArray().grouped { $0.name }
                expect(result["Foo"]?.count).to(equal(2))
                expect(result["Bar"]?.count).to(equal(1))
            }
            
            it("can group by int") {
                let result = getArray().grouped { $0.age }
                expect(result[10]?.count).to(equal(1))
                expect(result[20]?.count).to(equal(2))
            }
        }
    }
}

private struct TestItem: Equatable {
    
    var name: String
    var age: Int
}
