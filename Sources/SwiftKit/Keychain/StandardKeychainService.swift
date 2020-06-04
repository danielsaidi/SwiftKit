//
//  StandardKeychainService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This is a standard implementation of `KeychainService` that
 uses a `KeychainWrapper` to sync data with the keychain.
 */
public class StandardKeychainService: KeychainService {
    
    public init(wrapper: KeychainWrapper = .standard) {
        self.wrapper = wrapper
    }
    
    private let wrapper: KeychainWrapper
}


// MARK: - KeychainReader

extension StandardKeychainService {
    
    public func accessibility(for key: String) -> KeychainItemAccessibility? {
        wrapper.accessibility(for: key)
    }
    
    public func bool(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool? {
        wrapper.bool(for: key, with: accessibility)
    }
    
    public func data(for key: String, with accessibility: KeychainItemAccessibility?) -> Data? {
        wrapper.data(for: key, with: accessibility)
    }
    
    public func dataRef(for key: String, with accessibility: KeychainItemAccessibility?) -> Data? {
        wrapper.dataRef(for: key, with: accessibility)
    }
    
    public func double(for key: String, with accessibility: KeychainItemAccessibility?) -> Double? {
        wrapper.double(for: key, with: accessibility)
    }
    
    public func float(for key: String, with accessibility: KeychainItemAccessibility?) -> Float? {
        wrapper.float(for: key, with: accessibility)
    }
    
    public func hasValue(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.hasValue(for: key, with: accessibility)
    }
    
    public func integer(for key: String, with accessibility: KeychainItemAccessibility?) -> Int? {
        wrapper.integer(for: key, with: accessibility)
    }
    
    public func string(for key: String, with accessibility: KeychainItemAccessibility?) -> String? {
        wrapper.string(for: key, with: accessibility)
    }
}


// MARK: - KeychainWriter

extension StandardKeychainService {
    
    @discardableResult
    public func removeObject(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.removeObject(for: key, with: accessibility)
    }
    
    public func removeAllKeys() -> Bool {
        wrapper.removeAllKeys()
    }
    
    @discardableResult
    public func set(_ value: Bool, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.set(value, for: key, with: accessibility)
    }
    
    @discardableResult
    public func set(_ value: Data, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.set(value, for: key, with: accessibility)
    }
    
    @discardableResult
    public func set(_ value: Double, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.set(value, for: key, with: accessibility)
    }
    
    @discardableResult
    public func set(_ value: Float, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.set(value, for: key, with: accessibility)
    }
    
    @discardableResult
    public func set(_ value: Int, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.set(value, for: key, with: accessibility)
    }
    
    @discardableResult
    public func set(_ value: NSCoding, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.set(value, for: key, with: accessibility)
    }
    
    @discardableResult
    public func set(_ value: String, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        wrapper.set(value, for: key, with: accessibility)
    }
}
