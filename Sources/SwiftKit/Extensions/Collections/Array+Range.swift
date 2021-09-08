//
//  Array+RemoveObject.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-06-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Array where Element: Comparable & Strideable {
    
    /**
     Create an array using a set of values from the provided
     `range`, stepping `stepSize` between each value.
     */
    init(_ range: ClosedRange<Element>, stepSize: Element.Stride) {
        self = Array(stride(from: range.lowerBound, through: range.upperBound, by: stepSize))
    }
}

public extension Array where Element == Double {
    
    /**
     Create an array using a set of values from the provided
     `range`, stepping `stepSize` between each value.
     */
    init(_ range: ClosedRange<Element>, stepSize: Element.Stride) {
        self = Array(stride(from: range.lowerBound, through: range.upperBound, by: stepSize))
            .map { $0.roundedWithPrecision(from: stepSize) }
    }
}
