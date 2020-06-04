//
//  DateDecodersTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2018-09-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftKit

class DateDecodersTests: QuickSpec {
    
    override func spec() {
        
        describe("iso8601 decoder") {
            
            it("can decode date with seconds") {
                let string = "{ \"date\": \"2017-02-24T01:02:03+04:05\" }"
                let data = string.data(using: .utf8)!
                let decoder = JSONDecoder.iso8601
                let obj = try? decoder.decode(TestClass.self, from: data)
                expect(obj).toNot(beNil())
            }
            
            it("can decode date with milliseconds") {
                let string = "{ \"date\": \"2018-09-05T21:55:16.1184588Z\" }"
                let data = string.data(using: .utf8)!
                let decoder = JSONDecoder.iso8601
                let obj = try? decoder.decode(TestClass.self, from: data)
                expect(obj).toNot(beNil())
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
