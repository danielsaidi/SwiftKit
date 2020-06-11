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
    
    func closest(in collection: [Self], preferred: PreferredClosestValue) -> Self? {
        let sorted = collection.sorted()
        let smaller = sorted.last { $0 < self }
        let greater = sorted.first { $0 > self }
        switch preferred {
        case .greater: return greater ?? smaller
        case .smaller: return smaller ?? greater
        }
    }
}
