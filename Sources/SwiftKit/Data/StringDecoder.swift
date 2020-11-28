//
//  StringDecoder.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-03-21.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by classes that can decode
 strings.
 */
public protocol StringDecoder: AnyObject {
    
    func decode(_ string: String) -> String?
}
