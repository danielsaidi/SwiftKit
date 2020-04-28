//
//  CachedAuthenticationService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This service wraps another authentication service and keeps
 its authentication result in a cache.
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
    
    public func authenticate(_ auth: Authentication, reason: String, completion: @escaping AuthCompletion) {
        if isAlreadyAuthenticated(for: auth) { return completion(.success(())) }
        baseService.authenticate(auth, reason: reason) { result in
            self.handle(result, for: auth)
            completion(result)
        }
    }
    
    public func canAuthenticate(_ auth: Authentication) -> Bool {
        baseService.canAuthenticate(auth)
    }
    
    public func isAlreadyAuthenticated(for auth: Authentication) -> Bool {
        cache[auth.id] ?? false
    }
    
    public func resetAuthenticationCache(for auth: Authentication) {
        setIsAuthenticated(false, for: auth)
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
