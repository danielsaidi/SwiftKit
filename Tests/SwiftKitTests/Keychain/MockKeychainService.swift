//
//  MockKeychainService.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Mockery
import SwiftKit

class MockKeychainService: KeychainService, Mockable {
    
    let mock = Mock()
    
    typealias SetString = (String, String, KeychainItemAccessibility?) -> Bool
    
    func accessibility(for key: String) -> KeychainItemAccessibility? { nil }
    func bool(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool? { nil }
    func data(for key: String, with accessibility: KeychainItemAccessibility?) -> Data? { nil }
    func dataRef(for key: String, with accessibility: KeychainItemAccessibility?) -> Data? { nil }
    func double(for key: String, with accessibility: KeychainItemAccessibility?) -> Double? { nil }
    func float(for key: String, with accessibility: KeychainItemAccessibility?) -> Float? { nil }
    func hasValue(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { false }
    func integer(for key: String, with accessibility: KeychainItemAccessibility?) -> Int? { nil }
    func object(for key: String, with accessibility: KeychainItemAccessibility?) -> NSCoding? { nil }
    
    func string(for key: String, with accessibility: KeychainItemAccessibility?) -> String? {
        mock.invoke(string, args: (key, accessibility))
    }
    
    
    @discardableResult
    func removeObject(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { false }
    
    func removeAllKeys() -> Bool { false }
    
    @discardableResult
    func set(_ value: Bool, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { false }
    
    @discardableResult
    func set(_ value: Data, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { false }
    
    @discardableResult
    func set(_ value: Double, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { false }
    
    @discardableResult
    func set(_ value: Float, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { false }
    
    @discardableResult
    func set(_ value: Int, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { false }
    
    @discardableResult
    func set(_ value: NSCoding, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { false }
    
    @discardableResult
    func set(_ value: String, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        mock.registerResult(for: string) { _, _ in value }
        mock.registerResult(for: set as SetString) { _, _, _ in true }
        _ = mock.invoke(self.set, args: (value, key, accessibility))
        return true
    }
}
