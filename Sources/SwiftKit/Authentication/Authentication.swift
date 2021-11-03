//
//  Authentication.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-04-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This struct represents a unique authentication.
 
 This struct currently only has an ``id``, but is still used
 to improve the authentication info without having to change
 any authentication protocols.
 */
public struct Authentication {
    
    public init (id: String) {
        self.id = id
    }
    
    public var id: String
}

public extension Authentication {
    
    /**
     This standard authentication type can be used if you do
     not have many different authentications in your app.
     */
    static var standard: Authentication {
        Authentication(id: "com.swiftkit.auth.any")
    }
}
