//
//  StandardLanguageService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-03-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This service lets you change the locale of your app without
 having to restart the app for the change to be applied.
 
 This service wraps a translator, which is uses to translate
 language keys. A `StandardTranslator` will be used at first,
 but as soon as you call `setLocale` the standard translator
 will replaced with a `BundleTranslator`, that will used the
 bundle of the new locale.
 */
open class StandardLocalizationService: LocalizationService {
    
    public init(
        translator: Translator = StandardTranslator(),
        bundle: Bundle = .main,
        notificationCenter: NotificationCenter = .default,
        userDefaults: UserDefaults = .standard) {
        self.translator = translator
        self.bundle = bundle
        self.notificationCenter = notificationCenter
        self.userDefaults = userDefaults
    }
    
    private let bundle: Bundle
    private let notificationCenter: NotificationCenter
    private var translator: Translator
    private let userDefaults: UserDefaults
    
    public enum LocaleError: Error {
        case languageCodeIsMissing(for: Locale)
        case lprojFileDoesNotExist(for: Locale)
    }
    
    open func setLocale(_ locale: Locale) throws {
        guard let languageCode = locale.languageCode else { throw LocaleError.languageCodeIsMissing(for: locale) }
        guard loadBundle(for: languageCode) else { throw LocaleError.lprojFileDoesNotExist(for: locale) }
        notificationCenter.post(name: .localization(.localeWillChange), object: nil)
        userDefaults.set([languageCode], forKey: "AppleLanguages")
        notificationCenter.post(name: .localization(.localeDidChange), object: nil)
    }
    
    open func translate(_ key: String) -> String {
        translator.translate(key)
    }
}


// MARK: - Private Functions

private extension StandardLocalizationService {
    
    func loadBundle(for locale: String) -> Bool {
        guard let path = bundle.path(forResource: locale, ofType: "lproj") else { return false }
        guard let bundle = Bundle(path: path) else { return false }
        translator = BundleTranslator(bundle: bundle)
        return true
    }
}
