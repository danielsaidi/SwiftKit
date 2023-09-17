//
//  Filter.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "This will be removed in SwiftKit 2.0")
public struct Filter<T: FilterOption>: Equatable {
    
    public init(available: [T], selected: [T]) {
        self.available = available
        self.selected = selected
    }
    
    public let available: [T]
    public var selected: [T]
}

@available(*, deprecated, message: "This will be removed in SwiftKit 2.0")
public extension Filter {
    
    mutating func deselect(_ option: T) {
        selected = selected.filter { $0 != option }
    }
    
    mutating func select(_ option: T) {
        selected = Array(Set(selected + [option]))
    }
    
    func isIdentical(to filter: Filter<T>) -> Bool {
        let isAvailableIdentical = available.sorted() == filter.available.sorted()
        let isSelectedIdentical = selected.sorted() == filter.selected.sorted()
        return isAvailableIdentical && isSelectedIdentical
    }
}

@available(*, deprecated, message: "This will be removed in SwiftKit 2.0")
public protocol FilterOption: Hashable {
    
    associatedtype SortValue: Comparable
    
    var sortValue: SortValue { get }
}

@available(*, deprecated, message: "This will be removed in SwiftKit 2.0")
public extension Sequence where Iterator.Element: FilterOption {
    
    func sorted() -> [Element] {
        sorted { $0.sortValue < $1.sortValue }
    }
}
