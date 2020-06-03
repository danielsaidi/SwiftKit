//
//  String+Replace.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-01-08.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//
//  https://danielsaidi.com/blog/2020/06/04/string-replace
//

import Foundation

public extension String {
    
    func replacing(_ string: String, with: String) -> String {
        replacingOccurrences(of: string, with: with)
    }
    
    func replacing(_ string: String, with: String, caseSensitive: Bool) -> String {
        caseSensitive
            ? replacing(string, with: with)
            : replacingOccurrences(of: string, with: with, options: .caseInsensitive)
    }
}
