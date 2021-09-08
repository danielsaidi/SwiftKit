//
//  Comparable+Closest.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public enum PreferredClosestValue {
    
    case greater, smaller
}

public extension Comparable {
    
    /**
     Get the closest value in the provided `collection`. The
     provided `preferred` value whether to prefer a `greater`
     or a `lower` value if no exact match was found.
     */
    func closest(in collection: [Self], preferred: PreferredClosestValue) -> Self? {
        if collection.contains(self) { return self }
        let sorted = collection.sorted()
        let greater = sorted.first { $0 > self }
        let smaller = sorted.last { $0 < self }
        switch preferred {
        case .greater: return greater ?? smaller
        case .smaller: return smaller ?? greater
        }
    }
}
