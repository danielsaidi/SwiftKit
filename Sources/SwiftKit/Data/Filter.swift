//
//  Filter.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This struct lets you specify a list of available as well as
 selected `FilterOption`s.
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
    
    mutating func deselect(_ option: T) {
        selected = selected.filter { $0 != option }
    }
    
    mutating func select(_ option: T) {
        selected = Array(Set(selected + [option]))
    }
    
    func isIdentical(to filter: Filter<T>) -> Bool {
        isAvailableIdentical(to: filter) && isSelectedIdentical(to: filter)
    }
}

private extension Filter {

    func isAvailableIdentical(to filter: Filter<T>) -> Bool {
        available.sorted() == filter.available.sorted()
    }
    
    func isSelectedIdentical(to filter: Filter<T>) -> Bool {
        selected.sorted() == filter.selected.sorted()
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
