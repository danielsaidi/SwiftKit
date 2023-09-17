//
//  NumberFormatter+Util.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2022-10-19.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import Foundation

public extension NumberFormatter {

    /// Create a string for a double value.
    func string(for value: Double) -> String? {
        string(for: NSNumber(value: value))
    }
}
