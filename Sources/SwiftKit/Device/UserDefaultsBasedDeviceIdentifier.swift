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
 use a ``KeychainBasedDeviceIdentifier``.
 */
public class UserDefaultsBasedDeviceIdentifier: DeviceIdentifier {

    public init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    private let defaults: UserDefaults
    
    /**
     Get a unique device identifier from the user defaults.
     
     If no persisted identifier exists, this identifier will
     generate a new identifier, then persist and return that
     identifier.
     */
    public func getDeviceIdentifier() -> String {
        if let id = defaults.string(forKey: key) { return id }
        return generateDeviceIdentifier()
    }
}

private extension UserDefaultsBasedDeviceIdentifier {
    
    func generateDeviceIdentifier() -> String {
        let id = UUID().uuidString
        defaults.set(id, forKey: key)
        return id
    }
}
