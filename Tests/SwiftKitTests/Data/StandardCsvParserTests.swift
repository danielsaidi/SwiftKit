//
//  StandardCsvParserTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2018-10-23.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class StandardCsvParserTests: QuickSpec {
    
    override func spec() {
        
        var parser: CsvParser!
        
        beforeEach {
            parser = StandardCsvParser()
        }
        
        describe("parsing csv strings") {
            
            it("can parse semicolon-separated string") {
                let result = parser.parseCvsString("foo;bar;baz\nenough", separator: ";")
                expect(result.count).to(equal(2))
                expect(result[0]).to(equal(["foo", "bar", "baz"]))
                expect(result[1]).to(equal(["enough"]))
            }
            
            it("can parse comma-separated string") {
                let result = parser.parseCvsString("a,b,c", separator: ",")
                expect(result.count).to(equal(1))
                expect(result[0]).to(equal(["a", "b", "c"]))
            }
        }
    }
}
