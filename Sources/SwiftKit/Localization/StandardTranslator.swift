//
//  StandardTranslator.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-04-15.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This standard ``Translator`` implementation translates keys
 using `NSLocalizedString`.
 */
public class StandardTranslator: Translator {
    
    public init() {}
    
    /// Translate the provided key.
    public func translate(_ key: String) -> String {
        NSLocalizedString(key, comment: "")
    }
}
