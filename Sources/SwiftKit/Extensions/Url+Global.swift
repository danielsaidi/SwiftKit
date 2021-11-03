//
//  Url+Global.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-08-31.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 `TODO` Update this extension with the urls from this page:
 https://github.com/FifiTheBulldog/ios-settings-urls/blob/master/settings-urls.md
 */
public extension URL {
    
    /**
     This url leads to the Apple subscription screen for the
     currently logged in account.
     */
    static let userSubscriptions = URL(string: "https://apps.apple.com/account/subscriptions")
    
    /**
     This url leads to the App Store page for a certain app.
     */
    static func appStoreUrl(forAppId appId: Int) -> URL? {
        
        URL(string: "https://itunes.apple.com/app/id\(appId)")
    }
}
