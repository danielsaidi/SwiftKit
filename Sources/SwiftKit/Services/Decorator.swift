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
 class that implements the same protocol.
 
 This can be used to implement the "decorator pattern" which
 lets you compose functionality without inheritance.
 
 For instance, say that you have an external movie api, from
 which you fetch moves. A `MovieService` protocol could then
 be used to generally describe how to fetch movies, while an
 `ApiMovieService` class could provide a pure implementation
 of the protocol, by communicating directly with the api. In
 order to add things like caching, offline support etc. your
 app could now implement other `MovieService` implementation
 classes, that instead of inheriting `ApiMovieService` apply
 aisolated features on top of any `MovieService`.
 
 This gives you a more modular way of composing features. It
 lets you avoid long dependency chains, makes it easier when
 unit testing etc.
*/
open class Decorator<T> {
    
    public init(base: T) {
        self.base = base
    }
    
    public let base: T
}
