//
//  DeviceIdentifier.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by anything that can get a
 unique device identifier for the current device.
 */
public protocol DeviceIdentifier: AnyObject {
    
    func getDeviceIdentifier() -> String
}

extension DeviceIdentifier {
    
    var key: String { "com.swiftkit.deviceidentifier" }
}
