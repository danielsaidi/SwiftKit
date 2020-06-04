//
//  DateFormattersTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2018-09-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftKit

class DateFormattersTests: QuickSpec {
    
    override func spec() {
        
        describe("iso8601 second formatter") {
            
            it("is correctly setup") {
                let formatter = DateFormatter.iso8601Seconds
                expect(formatter.dateFormat).to(equal("yyyy-MM-dd'T'HH:mm:ssZ"))
                expect(formatter.calendar.identifier).to(equal(.iso8601))
                expect(formatter.locale.identifier).to(equal("en_US_POSIX"))
                expect(formatter.timeZone).toNot(beNil())
            }
        }
        
        describe("iso8601 millisecond formatter") {
            
            it("is correctly setup") {
                let formatter = DateFormatter.iso8601Milliseconds
                expect(formatter.dateFormat).to(equal("yyyy-MM-dd'T'HH:mm:ss.SSSZ"))
                expect(formatter.calendar.identifier).to(equal(.iso8601))
                expect(formatter.locale.identifier).to(equal("en_US_POSIX"))
                expect(formatter.timeZone).toNot(beNil())
            }
        }
    }
}
