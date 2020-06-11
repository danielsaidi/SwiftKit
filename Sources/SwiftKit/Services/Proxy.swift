//
//  Proxy.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This class can be implemented by any classes that should be
 used to proxy a certain operation to another target.
 
 This can be a useful approach when an operation or any kind
 of action should be performed, but you want to add a second
 layer of logic on top of it.
*/
open class Proxy<T> {
    
    public init(target: T) {
        self.target = target
    }
    
    public let target: T
}
