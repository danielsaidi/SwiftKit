//
//  BiometricAuthenticationService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import LocalAuthentication

/**
 This authentication service uses `LocalAuthentication` such
 as `FaceID` or `TOuchID` to authenticate the user.
 */
public class BiometricAuthenticationService: AuthenticationService {
    
    
    // MARK: - Initialization
    
    public init() {}
    
    
    // MARK: - Properties
    
    private let policy = LAPolicy.deviceOwnerAuthenticationWithBiometrics
    
    
    // MARK: - Public functions
    
    public func authenticateUser(for auth: Authentication, reason: String, completion: @escaping AuthCompletion) {
        guard canAuthenticateUser(for: auth) else { return completion(.failure(AuthError.unsupportedAuthentication)) }
        performAuthentication(for: auth, reason: reason) { result in
            DispatchQueue.main.async { completion(result) }
        }
    }
    
    public func canAuthenticateUser(for auth: Authentication) -> Bool {
        var error: NSError?
        return LAContext().canEvaluatePolicy(policy, error: &error)
    }
    
    public func performAuthentication(for auth: Authentication, reason: String, completion: @escaping AuthCompletion) {
        LAContext().evaluatePolicy(policy, localizedReason: reason) { result, error in
            if let error = error { return completion(.failure(error)) }
            if result == false { return completion(.failure(AuthError.authenticationFailed)) }
            completion(.success(()))
        }
    }
}
