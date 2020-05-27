//
//  Date+Compare.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-05-15.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Date {
    
    /**
     Whether or not the date occurs after the provided date.
     */
    func isAfter(_ date: Date) -> Bool {
        compare(date) == .orderedDescending
    }
    
    /**
     Whether or not the date occurs before the provided date.
    */
    func isBefore(_ date: Date) -> Bool {
        compare(date) == .orderedAscending
    }
    
    /**
     Whether or not the date is the same as the provided date.
     */
    func isSameAs(_ date: Date) -> Bool {
        compare(date) == .orderedSame
    }
}
