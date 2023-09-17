//
//  Translator.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-04-15.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by any classes that can be
 used to translate a localized string synchronously.
 */
public protocol Translator: AnyObject {
    
    /// Translate the provided key.
    func translate(_ key: String) -> String
}
