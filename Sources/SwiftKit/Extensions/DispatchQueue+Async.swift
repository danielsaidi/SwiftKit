//
//  DispatchQueue+Async.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//
//  https://danielsaidi.com/blog/2020/06/03/dispatch-queue
//

import Foundation

public extension DispatchQueue {
    
    /**
     Perform an operation after a time interval.
     */
    func asyncAfter(
        _ interval: DispatchTimeInterval,
        execute: @escaping () -> Void) {
        asyncAfter(
            deadline: .now() + interval,
            execute: execute)
    }
    /**
     Perform an operation after a time interval.
     */
    func asyncAfter(
        seconds: TimeInterval,
        execute: @escaping () -> Void) {
        let milli = Int(seconds * 1000)
        asyncAfter(.milliseconds(milli), execute: execute)
    }
    
    /**
     Perform an async operation then call a completion block
     on another queue (default `.main`) with the result from
     the async operation being passed on.
    */
    func async<T>(
        execute: @escaping () -> T,
        then completion: @escaping (T) -> Void,
        on completionQueue: DispatchQueue = .main) {
        async {
            let result = execute()
            completionQueue.async {
                completion(result)
            }
        }
    }
}
