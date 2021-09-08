//
//  Translator.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-04-15.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by any class that can take
 a localization key and translate it in one way or another.
 */
public protocol Translator: AnyObject {
    
    /**
     Translate the provided key to a localized string.
     */
    func translate(_ key: String) -> String
}
