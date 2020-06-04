//
//  KeychainWrapper.swift
//  SwiftKit
//
//  Based on https://github.com/jrendel/SwiftKeychainWrapper
//  Created by Jason Rendel on 9/23/14.
//  Copyright © 2014 Jason Rendel. All rights reserved.
//
//    The MIT License (MIT)
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.

import Foundation

private let paramSecMatchLimit = kSecMatchLimit as String
private let paramSecReturnData = kSecReturnData as String
private let paramSecReturnPersistentRef = kSecReturnPersistentRef as String
private let paramSecValueData = kSecValueData as String
private let paramSecAttrAccessible = kSecAttrAccessible as String
private let paramSecClass = kSecClass as String
private let paramSecAttrService = kSecAttrService as String
private let paramSecAttrGeneric = kSecAttrGeneric as String
private let paramSecAttrAccount = kSecAttrAccount as String
private let paramSecAttrAccessGroup = kSecAttrAccessGroup as String
private let paramSecReturnAttributes = kSecReturnAttributes as String


/**
 This class help make device keychain access easier in Swift.
 It is designed to make accessing the Keychain services more
 like using `NSUserDefaults`, which is much more familiar to
 developers in general.
 */
open class KeychainWrapper {
    
    
    // MARK: - Initialization
    
    private convenience init() {
        let id = Bundle.main.bundleIdentifier
        let fallback = "com.swiftkit.keychain"
        self.init(serviceName: id ?? fallback)
    }
    
    /// Create a custom instance of KeychainWrapper with a custom Service Name and optional custom access group.
    ///
    /// - parameter serviceName: The ServiceName for this instance. Used to uniquely identify all keys stored using this keychain wrapper instance.
    /// - parameter accessGroup: Optional unique AccessGroup for this instance. Use a matching AccessGroup between applications to allow shared keychain access.
    public init(serviceName: String, accessGroup: String? = nil) {
        self.serviceName = serviceName
        self.accessGroup = accessGroup
    }
    
    
    // MARK: - Properties
    
    /**
     This is the standard keychain wrapper instance.
     */
    public static let standard = KeychainWrapper()
    
    /**
     This is used to uniquely identify the keychain wrapper.
     */
    private let serviceName: String
    
    /**
     This is used to identify to which Keychain Access Group
     this entry belongs. This allows you to use this wrapper
     with shared access between applications.
     */
    private let accessGroup: String?
    
    
    // MARK: - Public Methods
    
    open func hasValue(forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> Bool {
        data(forKey: key, withAccessibility: accessibility) != nil
    }
    
    open func accessibilityOfKey(_ key: String) -> KeychainItemAccessibility? {
        var keychainQueryDictionary = setupKeychainQueryDictionary(forKey: key)
        var result: AnyObject?
        
        // Remove accessibility attribute
        keychainQueryDictionary.removeValue(forKey: paramSecAttrAccessible)
        
        // Limit search results to one
        keychainQueryDictionary[paramSecMatchLimit] = kSecMatchLimitOne
        
        // Specify we want SecAttrAccessible returned
        keychainQueryDictionary[paramSecReturnAttributes] = kCFBooleanTrue
        
        // Search
        let status = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(keychainQueryDictionary as CFDictionary, UnsafeMutablePointer($0))
        }
        
        if status == noErr, let dict = result as? [String: AnyObject], let val = dict[paramSecAttrAccessible] as? String {
            return KeychainItemAccessibility.accessibilityForAttributeValue(val as CFString)
        }
        
        return nil
    }
    
    
    // MARK: - Public Getters
    
    open func integer(forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> Int? {
        guard let numberValue = object(forKey: key, withAccessibility: accessibility) as? NSNumber else { return nil }
        return numberValue.intValue
    }
    
    open func float(forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> Float? {
        guard let numberValue = object(forKey: key, withAccessibility: accessibility) as? NSNumber else { return nil }
        return numberValue.floatValue
    }
    
    open func double(forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> Double? {
        guard let numberValue = object(forKey: key, withAccessibility: accessibility) as? NSNumber else { return nil }
        return numberValue.doubleValue
    }
    
    open func bool(forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> Bool? {
        guard let numberValue = object(forKey: key, withAccessibility: accessibility) as? NSNumber else { return nil }
        return numberValue.boolValue
    }
    
    open func string(forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> String? {
        guard let keychainData = data(forKey: key, withAccessibility: accessibility) else { return nil }
        return String(data: keychainData, encoding: String.Encoding.utf8) as String?
    }
    
    open func object(forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> NSCoding? {
        guard let keychainData = data(forKey: key, withAccessibility: accessibility) else { return nil }
        return NSKeyedUnarchiver.unarchiveObject(with: keychainData) as? NSCoding
    }
    
    open func data(forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> Data? {
        var keychainQueryDictionary = setupKeychainQueryDictionary(forKey: key, withAccessibility: accessibility)
        var result: AnyObject?
        
        // Limit search results to one
        keychainQueryDictionary[paramSecMatchLimit] = kSecMatchLimitOne
        
        // Specify we want Data/CFData returned
        keychainQueryDictionary[paramSecReturnData] = kCFBooleanTrue
        
        // Search
        let status = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(keychainQueryDictionary as CFDictionary, UnsafeMutablePointer($0))
        }
        
        return status == noErr ? result as? Data: nil
    }
    
    open func dataRef(forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> Data? {
        var keychainQueryDictionary = setupKeychainQueryDictionary(forKey: key, withAccessibility: accessibility)
        var result: AnyObject?
        
        // Limit search results to one
        keychainQueryDictionary[paramSecMatchLimit] = kSecMatchLimitOne
        
        // Specify we want persistent Data/CFData reference returned
        keychainQueryDictionary[paramSecReturnPersistentRef] = kCFBooleanTrue
        
        // Search
        let status = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(keychainQueryDictionary as CFDictionary, UnsafeMutablePointer($0))
        }
        
        return status == noErr ? result as? Data: nil
    }
    
    
    // MARK: - Public Setters
    
    @discardableResult
    open func set(_ value: Int, forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> Bool {
        set(NSNumber(value: value), forKey: key, withAccessibility: accessibility)
    }
    
    @discardableResult
    open func set(_ value: Float, forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> Bool {
        set(NSNumber(value: value), forKey: key, withAccessibility: accessibility)
    }
    
    @discardableResult
    open func set(_ value: Double, forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> Bool {
        set(NSNumber(value: value), forKey: key, withAccessibility: accessibility)
    }
    
    @discardableResult
    open func set(_ value: Bool, forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> Bool {
        set(NSNumber(value: value), forKey: key, withAccessibility: accessibility)
    }
    
    @discardableResult
    open func set(_ value: String, forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> Bool {
        guard let data = value.data(using: .utf8) else { return false }
        return set(data, forKey: key, withAccessibility: accessibility)
    }
    
    @discardableResult
    open func set(_ value: NSCoding, forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> Bool {
        let data = NSKeyedArchiver.archivedData(withRootObject: value)
        return set(data, forKey: key, withAccessibility: accessibility)
    }
    
    @discardableResult
    open func set(_ value: Data, forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> Bool {
        var keychainQueryDictionary: [String: Any] = setupKeychainQueryDictionary(forKey: key, withAccessibility: accessibility)
        
        keychainQueryDictionary[paramSecValueData] = value
        
        if let accessibility = accessibility {
            keychainQueryDictionary[paramSecAttrAccessible] = accessibility.keychainAttrValue
        } else {
            // Assign default protection - Protect the keychain entry so it's only valid when the device is unlocked
            keychainQueryDictionary[paramSecAttrAccessible] = KeychainItemAccessibility.whenUnlocked.keychainAttrValue
        }
        
        let status: OSStatus = SecItemAdd(keychainQueryDictionary as CFDictionary, nil)
        
        if status == errSecSuccess {
            return true
        } else if status == errSecDuplicateItem {
            return update(value, forKey: key, withAccessibility: accessibility)
        } else {
            return false
        }
    }

    @discardableResult
    open func removeObject(forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> Bool {
        let keychainQueryDictionary: [String: Any] = setupKeychainQueryDictionary(forKey: key, withAccessibility: accessibility)
        let status = SecItemDelete(keychainQueryDictionary as CFDictionary)
        return status == errSecSuccess
    }
    
    /**
     Remove all keychain items added with this wrapper. This
     will only delete items matching the current ServiceName
     and AccessGroup, if one is set.
     */
    open func removeAllKeys() -> Bool {
        // Setup dictionary to access keychain and specify we are using a generic password (rather than a certificate, internet password, etc)
        var keychainQueryDictionary: [String: Any] = [paramSecClass: kSecClassGenericPassword]
        
        // Uniquely identify this keychain accessor
        keychainQueryDictionary[paramSecAttrService] = serviceName
        
        // Set the keychain access group if defined
        if let accessGroup = self.accessGroup {
            keychainQueryDictionary[paramSecAttrAccessGroup] = accessGroup
        }
        
        let status: OSStatus = SecItemDelete(keychainQueryDictionary as CFDictionary)
        return status == errSecSuccess
    }
    
    /**
     Remove all keychain data, including data not added with
     this keychain wrapper.
     
     - Warning: This may remove custom keychain entries that
     you did not add via this wrapper.
     */
    open class func wipeKeychain() {
        deleteKeychainSecClass(kSecClassGenericPassword)    // Generic password items
        deleteKeychainSecClass(kSecClassInternetPassword)   // Internet password items
        deleteKeychainSecClass(kSecClassCertificate)        // Certificate items
        deleteKeychainSecClass(kSecClassKey)                // Cryptographic key items
        deleteKeychainSecClass(kSecClassIdentity)           // Identity items
    }
}


// MARK: - Private Methods

private extension KeychainWrapper {
    
    /**
     Remove all items for a given Keychain Item Class
     */
    @discardableResult
    class func deleteKeychainSecClass(_ secClass: AnyObject) -> Bool {
        let query = [paramSecClass: secClass]
        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess
    }
    
    /**
     Update ayn existing data associated with a specific key
     name. The existing data will be overwritten by new data.
     */
    private func update(_ value: Data, forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> Bool {
        var keychainQueryDictionary: [String: Any] = setupKeychainQueryDictionary(forKey: key, withAccessibility: accessibility)
        let updateDictionary = [paramSecValueData: value]
        
        // on update, only set accessibility if passed in
        if let accessibility = accessibility {
            keychainQueryDictionary[paramSecAttrAccessible] = accessibility.keychainAttrValue
        }
        
        // Update
        let status: OSStatus = SecItemUpdate(keychainQueryDictionary as CFDictionary, updateDictionary as CFDictionary)
        return status == errSecSuccess
    }
    
    /**
     Setup the keychain query dictionary, used to access the
     keychain on iOS for a specific key name and taking into
     account the Service Name and Access Group if one is set.
     
     - parameter forKey: The key this query is for
     - parameter withAccessibility: Optional accessibility to use when setting the keychain item. If none is provided, will default to .WhenUnlocked
     - returns: A dictionary with all the needed properties setup to access the keychain on iOS
     */
    private func setupKeychainQueryDictionary(forKey key: String, withAccessibility accessibility: KeychainItemAccessibility? = nil) -> [String: Any] {
        // Setup default access as generic password (rather than a certificate, internet password, etc)
        var keychainQueryDictionary: [String: Any] = [paramSecClass: kSecClassGenericPassword]
        
        // Uniquely identify this keychain accessor
        keychainQueryDictionary[paramSecAttrService] = serviceName
        
        // Only set accessibiilty if its passed in, we don't want to default it here in case the user didn't want it set
        if let accessibility = accessibility {
            keychainQueryDictionary[paramSecAttrAccessible] = accessibility.keychainAttrValue
        }
        
        // Set the keychain access group if defined
        if let accessGroup = self.accessGroup {
            keychainQueryDictionary[paramSecAttrAccessGroup] = accessGroup
        }
        
        // Uniquely identify the account who will be accessing the keychain
        let encodedIdentifier: Data? = key.data(using: String.Encoding.utf8)
        
        keychainQueryDictionary[paramSecAttrGeneric] = encodedIdentifier
        
        keychainQueryDictionary[paramSecAttrAccount] = encodedIdentifier
        
        return keychainQueryDictionary
    }
}
