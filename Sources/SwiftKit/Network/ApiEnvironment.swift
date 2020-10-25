//
//  ApiEnvironment.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-10-24.
//  Copyright © 2020 Cineasterna. All rights reserved.
//

import Foundation

/**
 This enum represents an external api environment, e.g. test,
 staging or production.
 
 The only requirement of an api environment is that is has a
 url, which serves as the root of all routes.
 */
public protocol ApiEnvironment {
    
    var url: URL { get }
}
