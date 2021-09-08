//
//  Filter.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This struct lets you specify available and selected options
 of a certain type.
 */
public struct Filter<T: FilterOption>: Equatable {
    
    public init(available: [T], selected: [T]) {
        self.available = available
        self.selected = selected
    }
    
    public let available: [T]
    public var selected: [T]
}

public extension Filter {
    
    /**
     Deselect a certain option.
     */
    mutating func deselect(_ option: T) {
        selected = selected.filter { $0 != option }
    }

    /**
     Select a certain option.
     */
    mutating func select(_ option: T) {
        selected = Array(Set(selected + [option]))
    }
    
    /**
     Whether or not the filter is identical to another value.
     */
    func isIdentical(to filter: Filter<T>) -> Bool {
        let isAvailableIdentical = available.sorted() == filter.available.sorted()
        let isSelectedIdentical = selected.sorted() == filter.selected.sorted()
        return isAvailableIdentical && isSelectedIdentical
    }
}

/**
 This protocol can be implemented by anything that can be used
 */
public protocol FilterOption: Hashable {
    
    associatedtype SortValue: Comparable
    
    var sortValue: SortValue { get }
}

public extension Sequence where Iterator.Element: FilterOption {
    
    func sorted() -> [Element] {
        sorted { $0.sortValue < $1.sortValue }
    }
}
