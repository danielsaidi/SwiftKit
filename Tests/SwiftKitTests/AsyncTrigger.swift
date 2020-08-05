//
//  AsyncTrigger.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

class AsyncTrigger {
    
    public init() {}
    
    private var counter = 0
    
    public var hasTriggered: Bool { counter > 0 }
    
    public func hasTriggered(numberOfTimes: Int) -> Bool {
        counter == numberOfTimes
    }
    
    public func trigger() {
        counter += 1
    }
}
