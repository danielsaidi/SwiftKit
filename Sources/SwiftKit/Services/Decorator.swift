//
//  Decorator.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This class can be inherited by any class that wraps another
 class that implements a protocol that the class implements.
 
 This can be used to implement service decorators to use the
 decorator pattern to compose functionality.
*/
open class Decorator<T> {
    
    public init(base: T) {
        self.base = base
    }
    
    public let base: T
}
