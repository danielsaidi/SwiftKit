//
//  ApiEnvironment.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-10-24.
//  Copyright © 2020 Cineasterna. All rights reserved.
//

import Foundation

/**
 This protocol represents an external api environment with a
 specific root `url`, e.g. test, staging or production.
 */
public protocol ApiEnvironment {
    
    var url: URL { get }
}
