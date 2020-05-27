//
//  Date+Adding.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-05-15.
//  Copyright © 2015-2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Date {
    
    func adding(days: Double) -> Date {
        let seconds = Double(days) * 60 * 60 * 24
        return addingTimeInterval(seconds)
    }
    
    func adding(hours: Double) -> Date {
        let seconds = Double(hours) * 60 * 60
        return addingTimeInterval(seconds)
    }
    
    func adding(minutes: Double) -> Date {
        let seconds = Double(minutes) * 60
        return addingTimeInterval(seconds)
    }
    
    func adding(seconds: Double) -> Date {
        addingTimeInterval(Double(seconds))
    }
    
    func removing(days: Double) -> Date {
        adding(days: -days)
    }
    
    func removing(hours: Double) -> Date {
        adding(hours: -hours)
    }
    
    func removing(minutes: Double) -> Date {
        adding(minutes: -minutes)
    }
    
    func removing(seconds: Double) -> Date {
        adding(seconds: -seconds)
    }
}
