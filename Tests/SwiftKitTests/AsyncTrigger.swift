//
//  AsyncTrigger.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

struct AsyncTrigger {
    
    var hasTriggered: Bool { triggerCount > 0 }
    private(set) var triggerCount = 0
    
    mutating func trigger() {
        triggerCount += 1
    }
}
