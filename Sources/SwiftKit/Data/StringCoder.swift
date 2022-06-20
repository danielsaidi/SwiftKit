//
//  StringDecoder.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-03-21.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by classes that can encode
 and decode strings.
 */
public protocol StringCoder: StringEncoder, StringDecoder {}

/**
 This protocol can be implemented by classes that can decode
 strings.
 */
public protocol StringDecoder: AnyObject {

    /**
     Decode a string to another string.
     */
    func decode(_ string: String) -> String?
}

/**
 This protocol can be implemented by classes that can encode
 strings.
 */
public protocol StringEncoder: AnyObject {

    /**
     Encode a string to something else.
    */
    func encode(_ string: String) -> String?
}
