//
//  CachedAuthenticationService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by any classes that can be
 used to authenticate the user and cache the result to avoid
 having to perform a real authentication if a successful one
 has already been performed.
 
 For instance, you can reduce the number of times users have
 to perform biometric authentication to access critical data.
 
 Note that you can't rely on a cached authentication service
 to clear its state. Call the ``resetUserAuthentications()``
 or ``resetUserAuthentication(for:)`` function as soon as an
 authenticated session becomes invalid, e.g. when the app is
 sent to the background or new users log in.
 */
public protocol CachedAuthenticationService: AuthenticationService {
    
    /**
     Check if the service has already authenticated the user
     for a certain authentication type.
     */
    func isUserAuthenticated(for auth: Authentication) -> Bool
    
    /**
     Reset the service's cached authentication state for the
     provided authentication type.
     */
    func resetUserAuthentication(for auth: Authentication)
    
    /**
     Reset the service's cached authentication state for all
     authentication types.
     */
    func resetUserAuthentications()
}
