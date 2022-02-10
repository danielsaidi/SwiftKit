//
//  String+UrlEncode.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//
//  https://danielsaidi.com/blog/2020/06/04/string-urlencode
//

import Foundation

public extension String {
    
    /**
     URL encode the string.
     
     This will first call `addingPercentEncoding`, using the
     `.urlPathAllowed` character set, then replace every `&`
     with `%26` and + with %2B.
     */
    func urlEncoded() -> String? {
        addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)?
            .replacingOccurrences(of: "&", with: "%26")
            .replacingOccurrences(of: "+", with: "%2B")
    }
}
