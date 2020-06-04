//
//  KeychainBasedDeviceIdentifierTests.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import SwiftKit

class KeychainBasedDeviceIdentifierTests: QuickSpec {
    
    override func spec() {
        
        describe("keychain-based device identifier") {
            
            var identifier: DeviceIdentifier!
            var keychainService: MockKeychainService!
            var backupIdentifier: MockDeviceIdentifier!
            
            beforeEach {
                keychainService = MockKeychainService()
                backupIdentifier = MockDeviceIdentifier()
                identifier = KeychainBasedDeviceIdentifier(
                    keychainService: keychainService,
                    backupIdentifier: backupIdentifier)
            }
            
            describe("getting device identifier") {
                
                context("when keychain value exists") {
                    
                    it("returns value") {
                        let id = "foo"
                        keychainService.registerResult(for: keychainService.string) { _, _ in id }
                        let result = identifier.getDeviceIdentifier()
                        expect(result).to(equal(id))
                    }
                }
                
                context("when keychain value does not exist") {
                    
                    beforeEach {
                        backupIdentifier.registerResult(for: backupIdentifier.getDeviceIdentifier) { "foo" }
                    }
                    
                    it("returns backup identifier value") {
                        let result = identifier.getDeviceIdentifier()
                        expect(result).to(equal("foo"))
                    }
                    
                    it("writes to keychain") {
                        _ = identifier.getDeviceIdentifier()
                        let inv = keychainService.invokations(of: keychainService.set as MockKeychainService.SetString)
                        expect(inv.count).to(equal(1))
                        expect(inv[0].arguments.0).to(equal("foo"))
                    }
                }
            }
        }
    }
}
