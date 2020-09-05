//
//  Date+Difference.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Date {
    
    func years(from date: Date, calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year], from: date, to: self).year ?? 0
    }
    
    func months(from date: Date, calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.month], from: date, to: self).month ?? 0
    }
    
    func weeks(from date: Date, calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.weekOfYear], from: date, to: self).weekOfYear ?? 0
    }
    
    func days(from date: Date, calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.day], from: date, to: self).day ?? 0
    }
    
    func hours(from date: Date, calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    
    func minutes(from date: Date, calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    
    func seconds(from date: Date, calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.second], from: date, to: self).second ?? 0
    }
}
