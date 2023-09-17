//
//  Url+Global.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-08-31.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension URL {
    
    /**
     This url leads to the App Store page for a certain app.
     */
    static func appStoreUrl(forAppId appId: Int) -> URL? {
        URL(string: "https://itunes.apple.com/app/id\(appId)")
    }
}
