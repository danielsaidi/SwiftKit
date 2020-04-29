//
//  CachedAuthenticationService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by services that can cache
 an authentication result, to avoid having to perform a real
 authentication operation if a successful authentication has
 already been performed.
 
 For instance, you can reduce the number of times users have
 to perform biometric authentication to access critical data.
 
 Note that you can't rely on a cached authentication service
 to clear its cached state. Call `resetUserAuthentication()`
 or `resetUserAuthentication(for:)` as soon as this state is
 considered to be invalid, e.g. when your app is send to the
 background and a new user can open the app at a later time.
 */
public protocol CachedAuthenticationService: AuthenticationService {
    
    /**
     Check if the user has already been authenticated for an
     authentication type.
     */
    func isUserAuthenticated(for auth: Authentication) -> Bool
    
    /**
     Reset the user's entire authentication state.
     */
    func resetUserAuthentication()
    
    /**
     Reset the user's authentication state for a single type
     of authentication.
     */
    func resetUserAuthentication(for auth: Authentication)
}
