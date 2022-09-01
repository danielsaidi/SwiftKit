//
//  DispatchQueue+Throttle.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-09-17.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

private var lastDebounceCallTimes = [AnyHashable: DispatchTime]()
private let nilContext: AnyHashable = Int.random(in: 0...100_000)
private var throttleWorkItems = [AnyHashable: DispatchWorkItem]()

public extension DispatchQueue {
    
    /**
     Try to perform a debounced operation.
     
     Executes a closure and ensures that no other executions
     will be made during the provided `interval`.
     
     - parameters:
       - interval: The time to delay a closure execution, in seconds
       - context: The context in which the debounce should be executed
       - action: The closure to be executed
     */
    func debounce(interval: Double, context: AnyHashable? = nil, action: @escaping () -> Void) {
        let worker = DispatchWorkItem {
            defer { throttleWorkItems.removeValue(forKey: context ?? nilContext) }
            action()
        }
        
        asyncAfter(deadline: .now() + interval, execute: worker)
        throttleWorkItems[context ?? nilContext]?.cancel()
        throttleWorkItems[context ?? nilContext] = worker
    }
    
    /**
     Try to perform a throttled operation.
     
     Performs the first performed operation, then delays any
     further operations until the provided `interval` passes.
     
     - parameters:
       - interval: The time to delay a closure execution, in seconds
       - context: The context in which the throttle should be executed
       - action: The closure to be executed
     */
    func throttle(interval: Double, context: AnyHashable? = nil, action: @escaping () -> Void) {
        if let last = lastDebounceCallTimes[context ?? nilContext], last + interval > .now() {
            return
        }
        
        lastDebounceCallTimes[context ?? nilContext] = .now()
        async(execute: action)
        debounce(interval: interval) {
            lastDebounceCallTimes.removeValue(forKey: context ?? nilContext)
        }
    }
}
