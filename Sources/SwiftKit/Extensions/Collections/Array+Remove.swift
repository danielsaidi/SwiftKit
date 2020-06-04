//
//  Array+RemoveObject.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-03-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    
    mutating func remove(_ object: Element) {
        self = removing(object)
    }
    
    func removing(_ object: Element) -> [Element] {
        filter { $0 != object }
    }
}
