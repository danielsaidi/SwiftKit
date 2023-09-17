//
//  ComparisonResult+Shortcuts.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension ComparisonResult {
    
    /// This is an `.orderedAscending` shorthand.
    static var ascending: ComparisonResult {
        .orderedAscending
    }
    
    /// This is an `.orderedDescending` shorthand.
    static var descending: ComparisonResult {
        .orderedDescending
    }
}
