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
 authentication results, to avoid having to perform the real
 authentication operation every time.
 
 For instance, you can reduce the number of times users have
 to perform biometric authentication to access critical data.
 Note that you can never rely on the cache implementation to
 clear this data. Always call `resetAuthentication(for:)` as
 soon as the state can be considered to become invalid, e.g.
 when the app resigns its active state.
 */
public protocol CachedAuthenticationService: AuthenticationService {
    
    /**
     Check if a certain authentication is authenticated, e.g. if
     the cached authentication state is still valid.
     */
    func isAlreadyAuthenticated(for auth: Authentication) -> Bool
    
    /**
     Reset a cached authentication state for a specific auth.
     */
    func resetAuthenticationCache(for auth: Authentication)
}
