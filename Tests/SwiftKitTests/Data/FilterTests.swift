//
//  FilterTests.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class FilterTests: QuickSpec {
    
    override func spec() {
        
        var array11: [TestOption] { [.swedish, .finnish] }
        var array12: [TestOption] { [.finnish, .swedish] }
        var array21: [TestOption] { [.swedish, .english] }
        var array22: [TestOption] { [.english, .swedish] }
        var array3: [TestOption] { [.german, .swedish] }

        describe("selecting") {
            
            it("adds a selected option once") {
                var filter = Filter(available: array11, selected: [])
                filter.select(.swedish)
                filter.select(.swedish)
                expect(filter.selected).to(equal([.swedish]))
            }
        }
        
        describe("deselecting") {
            
            it("removes a selected option") {
                var filter = Filter(available: array11, selected: [])
                filter.select(.swedish)
                expect(filter.selected).to(equal([.swedish]))
                filter.deselect(.finnish)
                expect(filter.selected).to(equal([.swedish]))
                filter.deselect(.swedish)
                expect(filter.selected).to(equal([]))
            }
        }
        
        describe("is identical") {
            
            it("is identical if both arrays contains same elements") {
                let filter1 = Filter(available: array11, selected: array21)
                let filter2 = Filter(available: array12, selected: array21)
                expect(filter1.isIdentical(to: filter2)).to(beTrue())
            }
            
            it("is not identical if available filters contains different elements") {
                let filter1 = Filter(available: array11, selected: array21)
                let filter2 = Filter(available: array3, selected: array22)
                expect(filter1.isIdentical(to: filter2)).to(beFalse())
            }
            
            it("is not identical if selected filters contains different elements") {
                let filter1 = Filter(available: array11, selected: array21)
                let filter2 = Filter(available: array12, selected: array3)
                expect(filter1.isIdentical(to: filter2)).to(beFalse())
            }
        }
    }
}

private enum TestOption: String, FilterOption {
    
    case swedish, finnish, english, german
    
    var sortValue: String { rawValue }
}
