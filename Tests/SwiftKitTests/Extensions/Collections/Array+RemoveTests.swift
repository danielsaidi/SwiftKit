//
//  Array+RemoveObjectTests.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-12-13.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class Array_RemoveObjectTests: QuickSpec {
    
    override func spec() {
        
        describe("remove object from array") {
            
            it("does not remove non-existing int") {
                var array = [1, 2, 3, 4]
                array.remove(object: 5)
                expect(array).to(equal([1, 2, 3, 4]))
            }
            
            it("removes existing int") {
                var array = [1, 2, 3, 4]
                array.remove(object: 3)
                expect(array).to(equal([1, 2, 4]))
            }
            
            it("removes existing string") {
                var array = ["foo", "bar", "baz"]
                array.remove(object: "bar")
                expect(array).to(equal(["foo", "baz"]))
            }
        }
        
        describe("removing object from array copy") {
            
            it("does not remove non-existing int") {
                let array = [1, 2, 3, 4]
                let result = array.removing(object: 5)
                expect(array).to(equal([1, 2, 3, 4]))
                expect(result).to(equal([1, 2, 3, 4]))
            }
            
            it("removes existing int") {
                let array = [1, 2, 3, 4]
                let result = array.removing(object: 3)
                expect(array).to(equal([1, 2, 3, 4]))
                expect(result).to(equal([1, 2, 4]))
            }
            
            it("removes existing string") {
                let array = ["foo", "bar", "baz"]
                let result = array.removing(object: "bar")
                expect(array).to(equal(["foo", "bar", "baz"]))
                expect(result).to(equal(["foo", "baz"]))
            }
        }
    }
}
