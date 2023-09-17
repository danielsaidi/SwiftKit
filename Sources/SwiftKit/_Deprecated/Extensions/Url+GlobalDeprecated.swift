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
     This url leads to the Apple subscription screen for the
     currently logged in account.
     */
    @available(*, deprecated, message: "Use native functionality instead")
    static let userSubscriptions = URL(string: "https://apps.apple.com/account/subscriptions")
}
