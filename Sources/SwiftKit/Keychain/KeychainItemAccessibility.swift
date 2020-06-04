//
//  KeychainItemAccessibility.swift
//  SwiftKit
//
//  Based on https://github.com/jrendel/SwiftKeychainWrapper
//  Created by James Blair on 4/24/16.
//  Copyright © 2016 Jason Rendel. All rights reserved.
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


public protocol KeychainAttrRepresentable {
    
    var keychainAttrValue: CFString { get }
}

/**
 This enum defines the various access scopes that a keychain
 item can use. The names follow certain conventions that are
 defined in the list below:
 
 * `afterFirstUnlock`
 The attribute cannot be accessed after a restart, until the
 device has been unlocked once by the user. After this first
 unlock, the items remains accessible until the next restart.
 This is recommended for items that must be available to any
 background applications or processes.
 
 * `always`
 The attribute can always be accessed, whether the device is
 locked or not. This is not recommended for production apps.
 
 * `ThisDeviceOnly`
 The attribute will not be included in encrypted backup, and
 are thus not available after restoring apps from backups on
 a different device.
 
 * `whenPasscodeSet`
 The attribute can only be accessed when the device has been
 unlocked by the user and a device passcode is set. No items
 can be stored on device if a passcode is not set. Disabling
 the passcode will delete all passcode protected items.
 
 * `whenUnlocked`
 The attribute can only be accessed when the device has been
 unlocked by the user. This is recommended for items that we
 only mean to use when the application is active.
 */
public enum KeychainItemAccessibility {
    
    case afterFirstUnlock
    case afterFirstUnlockThisDeviceOnly
    case always
    case alwaysThisDeviceOnly
    case whenPasscodeSetThisDeviceOnly
    case whenUnlocked
    case whenUnlockedThisDeviceOnly
    
    static func accessibilityForAttributeValue(_ keychainAttrValue: CFString) -> KeychainItemAccessibility? {
        keychainItemAccessibilityLookup.first { $0.value == keychainAttrValue }?.key
    }
}


private let keychainItemAccessibilityLookup: [KeychainItemAccessibility: CFString] = [
    .afterFirstUnlock: kSecAttrAccessibleAfterFirstUnlock,
    .afterFirstUnlockThisDeviceOnly: kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly,
    .always: kSecAttrAccessibleAlways,
    .whenPasscodeSetThisDeviceOnly: kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly,
    .alwaysThisDeviceOnly: kSecAttrAccessibleAlwaysThisDeviceOnly,
    .whenUnlocked: kSecAttrAccessibleWhenUnlocked,
    .whenUnlockedThisDeviceOnly: kSecAttrAccessibleWhenUnlockedThisDeviceOnly
]

extension KeychainItemAccessibility: KeychainAttrRepresentable {
    
    public var keychainAttrValue: CFString {
        keychainItemAccessibilityLookup[self]!
    }
}
