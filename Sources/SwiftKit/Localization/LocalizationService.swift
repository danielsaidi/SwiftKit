//
//  LocalizationService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-03-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented any ``Translator`` that is
 also capable of changing the app's current locale.
 
 Implementations of this protocol should make sure to post a
 ``LocalizationNotification`` when the app locale changes.
 */
public protocol LocalizationService: Translator {
    
    /**
     Change the service's locale.
     */
    func setLocale(_ locale: Locale) throws
}
