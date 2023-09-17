//
//  String+Contains.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-02-17.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//
//  https://danielsaidi.com/blog/2020/06/04/string-contains
//

import Foundation

public extension String {
    
    /// Check if this string contains another string.
    func contains(_ string: String, caseSensitive: Bool) -> Bool {
        caseSensitive
            ? contains(string)
            : range(of: string, options: .caseInsensitive) != nil
    }
}
