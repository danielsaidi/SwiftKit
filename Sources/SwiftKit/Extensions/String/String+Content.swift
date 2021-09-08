//
//  String+Content.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    /**
     Check whether or not the string has any content.
     */
    var hasContent: Bool {
        !isEmpty
    }
    
    /**
     Check whether or not the string has any trimmed content
     after leading and trailing whitespaces are removed.
     */
    var hasTrimmedContent: Bool {
        !trimmingCharacters(in: .whitespaces).isEmpty
    }
}
