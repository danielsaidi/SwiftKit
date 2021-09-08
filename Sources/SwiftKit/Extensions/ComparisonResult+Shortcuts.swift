//
//  ComparisonResult+Shortcuts.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension ComparisonResult {
    
    /**
     This is a shorthand to `.orderedAscending`
     */
    static var ascending: ComparisonResult {
        .orderedAscending
    }
    
    /**
     This is a shorthand to `.orderedDescending`
     */
    static var descending: ComparisonResult {
        .orderedDescending
    }
}
