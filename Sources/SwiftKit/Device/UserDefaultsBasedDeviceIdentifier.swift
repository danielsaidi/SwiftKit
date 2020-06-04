//
//  UserDefaultsBasedDeviceIdentifier.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This device identifier generates a unique device identifier
 and stores it in user defaults, so that the same identifier
 is used every time for each app installation.
 
 If you want to use the same identifier between app installs,
 
 
 The user default fallback maximizes the chance that the app
 can retrieve the identifier even if the keychain can not be
 read at the time of retrieval.
 */
public class UserDefaultsBasedDeviceIdentifier: DeviceIdentifier {

    public init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    private let userDefaults: UserDefaults
    
    public func getDeviceIdentifier() -> String {
        if let id = userDefaults.string(forKey: key) { return id }
        return generateDeviceIdentifier()
    }
    
    public func generateDeviceIdentifier() -> String {
        let id = UUID().uuidString
        userDefaults.set(id, forKey: key)
        userDefaults.synchronize()
        return id
    }
}
