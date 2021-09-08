//
//  DateFormatters.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2018-09-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension DateFormatter {
    
    /**
     Create a custom date formatter, that uses a custom date
     format, calendar, locale and time zone.
     */
    convenience init(
        dateFormat: String,
        calendar: Calendar = Calendar(identifier: .iso8601),
        locale: Locale = Locale(identifier: "en_US_POSIX"),
        timeZone: TimeZone? = TimeZone(secondsFromGMT: 0)) {
        self.init()
        self.calendar = calendar
        self.locale = locale
        self.dateFormat = dateFormat
        self.timeZone = timeZone
    }
    
    /**
     Create a date formatter using the ISO8601 second format.
     */
    static var iso8601Seconds: DateFormatter {
        DateFormatter(dateFormat: "yyyy-MM-dd'T'HH:mm:ssZ")
    }
    
    /**
     Create a date formatter using the ISO8601 ms format.
    */
    static var iso8601Milliseconds: DateFormatter {
        DateFormatter(dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
    }
}
