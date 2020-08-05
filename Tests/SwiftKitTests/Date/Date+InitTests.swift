//
//  Date+InitTests.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftKit

class Date_InitTests: QuickSpec {
    
    override func spec() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        describe("date") {
            
            it("can be initialized with date components") {
                let date = Date(year: 2011, month: 12, day: 10)!
                let string = formatter.string(from: date)
                expect(string).to(equal("2011-12-10 00:00:00"))
            }
            
            it("can be initialized with time components") {
                let date = Date(year: 2010, month: 03, day: 22, hour: 14, minute: 21, second: 32)!
                let string = formatter.string(from: date)
                expect(string).to(equal("2010-03-22 14:21:32"))
            }
        }
    }
}
