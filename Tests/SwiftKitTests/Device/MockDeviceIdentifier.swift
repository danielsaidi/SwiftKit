//
//  MockDeviceIdentifier.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-06-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import MockingKit
import SwiftKit

class MockDeviceIdentifier: Mock, DeviceIdentifier {
    
    lazy var getDeviceIdentifierRef = MockReference(getDeviceIdentifier)
    
    func getDeviceIdentifier() -> String {
        invoke(getDeviceIdentifierRef, args: ())
    }
}
