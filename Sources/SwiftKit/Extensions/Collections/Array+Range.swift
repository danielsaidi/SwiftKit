//
//  Array+RemoveObject.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-06-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Array where Element: Comparable & Strideable {
    
    init(_ range: ClosedRange<Element>, stepSize: Element.Stride) {
        self = Array(stride(from: range.lowerBound, through: range.upperBound, by: stepSize))
    }
}

public extension Array where Element == Double {
    
    init(_ range: ClosedRange<Element>, stepSize: Element.Stride) {
        self = Array(stride(from: range.lowerBound, through: range.upperBound, by: stepSize))
            .map { $0.roundedWithPrecision(from: stepSize) }
    }
}
