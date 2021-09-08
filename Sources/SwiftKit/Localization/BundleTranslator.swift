//
//  BundleTranslator.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-04-15.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This `Translator` translates keys using a certain `Bundle`.
 */
public class BundleTranslator: Translator {
    
    public init(bundle: Bundle) {
        self.bundle = bundle
    }
    
    private let bundle: Bundle
    
    /**
     Translate the provided key to a localized string.
     */
    public func translate(_ key: String) -> String {
        bundle.localizedString(forKey: key, value: "", table: nil)
    }
}
