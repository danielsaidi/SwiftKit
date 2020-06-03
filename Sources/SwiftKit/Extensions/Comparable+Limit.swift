//
//  Comparable+Limit.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2018-10-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Comparable {
    
    /**
     Limit this value to a `min` and a `max` value.
     
     This function culd be implemented in a oneliner, but it
     would make the code less readable.
     */
    func limit(min: Self, max: Self) -> Self {
        if self < min { return min }
        if self > max { return max }
        return self
    }
}
