//
//  Sequence+Group.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Sequence {

    /**
     Group the sequence into a dictionary using any property
     from the sequence item type.
     */
    func grouped<T>(by grouper: (Element) -> T) -> [T: [Element]] {
        Dictionary(grouping: self, by: grouper)
    }
}
