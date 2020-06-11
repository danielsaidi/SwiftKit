//
//  MultiProxy.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This class can be implemented by any classes that should be
 used to proxy a certain operation to many targets.
 
 This can be a useful approach when an operation or any kind
 of action could be performed by several unrelated receivers.
 
 This approach should not be used when a certain action must
 be performed in a certain way.
 */
open class MultiProxy<T> {
    
    public init(targets: [T]) {
        self.targets = targets
    }
    
    public let targets: [T]
}
