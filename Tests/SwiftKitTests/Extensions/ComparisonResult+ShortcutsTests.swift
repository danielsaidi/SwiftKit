//
//  ComparisonResult+ShortcutsTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftKit

class ComparisonResult_ShortcutsTests: QuickSpec {
    
    override func spec() {
        
        describe("order shortcut") {
            
            it("has correct values") {
                expect(ComparisonResult.ascending).to(equal(.orderedAscending))
                expect(ComparisonResult.descending).to(equal(.orderedDescending))
            }
        }
    }
}
