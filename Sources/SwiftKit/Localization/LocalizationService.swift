//
//  LocalizationService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-03-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by a class that implements
 `Translator` and also can change the the app's locale.
 
 `LocalizationService` should post `LocalizationNotification`
 notifications when the app locale changes.
 */
public protocol LocalizationService: Translator {
    
    /**
     Change the service's locale.
     */
    func setLocale(_ locale: Locale) throws
}
