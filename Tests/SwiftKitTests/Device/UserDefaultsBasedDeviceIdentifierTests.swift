//
//  UserDefaultsBasedDeviceIdentifierTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
import MockingKit
@testable import SwiftKit

class UserDefaultsBasedDeviceIdentifierTests: QuickSpec {
    
    override func spec() {
        
        describe("user defaults-based device identifier") {
            
            var identifier: DeviceIdentifier!
            var defaults: MockUserDefaults!
            
            beforeEach {
                defaults = MockUserDefaults()
                identifier = UserDefaultsBasedDeviceIdentifier(defaults: defaults)
            }
            
            describe("getting device identifier") {
                
                context("when persisted value exists") {
                    
                    it("returns value") {
                        defaults.registerResult(for: defaults.stringRef) { _ in "foo" }
                        let result = identifier.getDeviceIdentifier()
                        expect(result).to(equal("foo"))
                    }
                }
                
                context("when persisted value does not exist") {
                    
                    it("generates new id") {
                        let result = identifier.getDeviceIdentifier()
                        expect(result.count).to(equal(36))
                    }
                    
                    it("writes to user defaults") {
                        _ = identifier.getDeviceIdentifier()
                        let calls = defaults.calls(to: defaults.setValueRef)
                        expect(calls.count).to(equal(1))
                        let arg = calls[0].arguments.0 as? String
                        expect(arg?.count).to(equal(36))
                    }
                }
            }
        }
    }
}
