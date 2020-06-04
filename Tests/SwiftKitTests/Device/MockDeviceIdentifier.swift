//
//  MockDeviceIdentifier.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Mockery
import SwiftKit

class MockDeviceIdentifier: Mock, DeviceIdentifier {
    
    func getDeviceIdentifier() -> String {
        invoke(getDeviceIdentifier, args: ())
    }
}
