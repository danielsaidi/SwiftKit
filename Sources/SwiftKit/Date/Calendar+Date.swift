//
//  Calendar+Date.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-04-29.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Calendar {
    
    func isDateThisWeek(_ date: Date) -> Bool {
        isDate(date, equalTo: Date(), toGranularity: .weekOfYear)
    }
    
    func isDateThisMonth(_ date: Date) -> Bool {
        isDate(date, equalTo: Date(), toGranularity: .month)
    }
    
    func isDateThisYear(_ date: Date) -> Bool {
        isDate(date, equalTo: Date(), toGranularity: .year)
    }
    
    func isDateToday(_ date: Date) -> Bool {
        isDate(date, equalTo: Date(), toGranularity: .day)
    }
}
