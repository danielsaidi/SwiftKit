//
//  HttpMethod.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-09-30.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This enum lists the various HTTP methods that are supported
 by REST.
 */
public enum HttpMethod: String {
    
    case connect
    case delete
    case get
    case head
    case options
    case post
    case put
    case trace
    
    public var method: String { rawValue.uppercased() }
}
