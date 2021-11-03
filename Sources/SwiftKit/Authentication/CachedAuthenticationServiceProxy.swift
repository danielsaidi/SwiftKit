//
//  CachedAuthenticationService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This class wraps another ``AuthenticationService`` instance
 and keeps authentication results in a cache.
 */
public class CachedAuthenticationServiceProxy: CachedAuthenticationService {
    
    
    // MARK: - Initialization
    
    public init(baseService: AuthenticationService) {
        self.baseService = baseService
    }
    
    
    // MARK: - Properties
    
    private let baseService: AuthenticationService
    
    private var cache = [String: Bool]()
    
    
    // MARK: - Functions
    
    /**
     Authenticate the user for a certain authentication type.
     
     `reason` can be used to display information to the user.
     */
    public func authenticateUser(for auth: Authentication, reason: String, completion: @escaping AuthCompletion) {
        if isUserAuthenticated(for: auth) { return completion(.success(())) }
        baseService.authenticateUser(for: auth, reason: reason) { result in
            self.handle(result, for: auth)
            completion(result)
        }
    }
    
    /**
     Check if the service instance can authenticate the user.
     */
    public func canAuthenticateUser(for auth: Authentication) -> Bool {
        baseService.canAuthenticateUser(for: auth)
    }
    
    /**
     Check if the service has already authenticated the user
     for a certain authentication type.
     */
    public func isUserAuthenticated(for auth: Authentication) -> Bool {
        cache[auth.id] ?? false
    }
    
    /**
     Reset the service's cached authentication state for the
     provided authentication type.
     */
    public func resetUserAuthentication(for auth: Authentication) {
        setIsAuthenticated(false, for: auth)
    }
    
    /**
     Reset the service's cached authentication state for all
     authentication types.
     */
    public func resetUserAuthentications() {
        cache.removeAll()
    }
}


// MARK: - Private Functions

private extension CachedAuthenticationServiceProxy {
    
    func handle(_ result: AuthResult, for auth: Authentication) {
        switch result {
        case .failure: setIsAuthenticated(false, for: auth)
        case .success: setIsAuthenticated(true, for: auth)
        }
    }
    
    func setIsAuthenticated(_ isAuthenticated: Bool, for auth: Authentication) {
        cache[auth.id] = isAuthenticated
    }
}
