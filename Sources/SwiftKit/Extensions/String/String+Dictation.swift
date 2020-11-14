//
//  String+Dictation.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-11-14.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    /**
     This function cleans up the string from space and other
     strange characters that can be added to the string when
     the user performs a dictation.
     */
    func cleanedUpAfterDictation() -> String {
        self
            .replacingOccurrences(of: "\u{fffc}", with: "")
            .trimmingCharacters(in: .whitespaces)
    }
}
