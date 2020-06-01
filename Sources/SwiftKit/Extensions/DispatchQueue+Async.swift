//
//  DispatchQueue+Async.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension DispatchQueue {
    
    /**
     Perform an operation after a time interval.
     */
    func asyncAfter(
        interval: DispatchTimeInterval,
        execute: @escaping () -> Void) {
        asyncAfter(
            deadline: .now() + interval,
            execute: execute)
    }
    
    /**
     Perform an async operation then call a completion block
     on another queue (default `.main`) with the result from
     the async operation being passed on.
    */
    func async<T>(
        execute: @escaping () -> T,
        then: @escaping (T) -> Void,
        on queue: DispatchQueue = .main) {
        async {
            let result = execute()
            queue.async {
                then(result)
            }
        }
    }
}
