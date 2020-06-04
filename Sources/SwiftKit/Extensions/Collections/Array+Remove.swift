//
//  Array+RemoveObject.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-03-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    
    mutating func remove(object: Element) {
        guard let index = self.firstIndex(of: object) else { return }
        remove(at: index)
    }
    
    func removing(object: Element) -> Self {
        var copy = self
        copy.remove(object: object)
        return copy
    }
}
