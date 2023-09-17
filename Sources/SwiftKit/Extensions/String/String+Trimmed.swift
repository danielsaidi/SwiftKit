//
//  String+Trimmed.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-11-15.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    /// This is a `trimmingCharacters(in:)` shorthand.
    func trimmed(
        for set: CharacterSet = .whitespacesAndNewlines
    ) -> String {
        self.trimmingCharacters(in: set)
    }
}
