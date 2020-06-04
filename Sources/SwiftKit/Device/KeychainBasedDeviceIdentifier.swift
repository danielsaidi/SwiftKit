//
//  KeychainBasedDeviceIdentifier.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This device identifier generates a unique device identifier
 and stores it in keychain, to make it possible to reuse the
 identifier, even if the app is uninstalled.
 
 The user default fallback maximizes the chance that the app
 can retrieve the identifier even if the keychain can not be
 read at the time of retrieval.
 */
public class KeychainBasedDeviceIdentifier: DeviceIdentifier {

    public init(
        keychainService: KeychainService,
        backupIdentifier: UserDefaultsBasedDeviceIdentifier = .init()) {
        self.keychainService = keychainService
        self.backupIdentifier = backupIdentifier
    }
    
    private let backupIdentifier: UserDefaultsBasedDeviceIdentifier
    private let keychainService: KeychainService
    
    public func getDeviceIdentifier() -> String {
        if let id = keychainService.string(for: key, with: nil) { return id }
        return backupIdentifier.generateDeviceIdentifier()
    }
}
