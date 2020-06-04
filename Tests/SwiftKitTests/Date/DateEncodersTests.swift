//
//  DateEncodersTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2018-09-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftKit

class DateEncodersTests: QuickSpec {
    
    override func spec() {
        
        describe("iso8601 encoder") {
            
            it("can encode date to string") {
                let obj = TestClass(date: Date(timeIntervalSince1970: 12132141))
                let encoder = JSONEncoder.iso8601
                let data = try? encoder.encode(obj)
                let string = String(data: data!, encoding: .utf8)
                let expected = "{\"date\":\"1970-05-21T10:02:21.000+0000\"}"
                expect(string).to(equal(expected))
            }
        }
    }
}


private class TestClass: Codable {
    
    init(date: Date) {
        self.date = date
    }
    
    var date: Date
    
    enum CodingKeys: String, CodingKey {
        case date
    }
}
