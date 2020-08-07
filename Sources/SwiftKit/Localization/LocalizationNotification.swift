//
//  LocalizationNotification.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-03-19.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation


public extension NSNotification.Name {

    /**
     Gets a localization-specific notification.
     */
    static func localization(_ notification: LocalizationNotification) -> NSNotification.Name {
        notification.name
    }
}

/**
 This enum has localization-specific notifications.
 */
public enum LocalizationNotification: String {
    
    case
    localeWillChange,
    localeDidChange
    
    public var name: NSNotification.Name {
        NSNotification.Name(rawValue: "com.danielsaidi.swiftkit.\(rawValue)")
    }
}
