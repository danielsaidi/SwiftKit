//
//  Base64StringEncoder.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-03-21.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This coder can encode and decode strings to and from base64.
 */
public class Base64StringCoder: StringCoder {
    
    public init() {}
    
    /**
     Decode a base64 encoded string.
     */
    public func decode(string: String) -> String? {
        guard let data = Data(base64Encoded: string, options: .ignoreUnknownCharacters) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    /**
     Encode a string to base64.
    */
    public func encode(string: String) -> String? {
        let data = string.data(using: .utf8)
        let encoded = data?.base64EncodedData(options: .endLineWithLineFeed)
        guard let encodedData = encoded else { return nil }
        return String(data: encodedData, encoding: .utf8)
    }
}
