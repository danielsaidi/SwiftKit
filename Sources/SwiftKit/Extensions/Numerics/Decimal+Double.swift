//
//  Decimal+Double.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Decimal {
    
    var doubleValue: Double {
        Double(truncating: self as NSNumber)
    }
}
