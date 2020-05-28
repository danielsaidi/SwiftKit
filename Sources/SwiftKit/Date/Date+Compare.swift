//
//  Date+Compare.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-05-15.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 `TODO` These extensions made more sense when you had to use
 comparison results. Now, it's just semantics over syntax. I
 may remove these later.
 */
public extension Date {
    
    /**
     Whether or not the date occurs after the provided date.
     */
    func isAfter(_ date: Date) -> Bool {
        self > date
    }
    
    /**
     Whether or not the date occurs before the provided date.
    */
    func isBefore(_ date: Date) -> Bool {
        self < date
    }
    
    /**
     Whether or not the date is the same as the provided date.
     */
    func isSame(as date: Date) -> Bool {
        self == date
    }
}
