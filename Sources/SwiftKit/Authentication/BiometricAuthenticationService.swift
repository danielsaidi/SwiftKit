//
//  BiometricAuthenticationService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import LocalAuthentication

/**
 This authentication service uses `LocalAuthentication` such
 as `FaceID` or `TOuchID` to authenticate the user.
 */
@available(iOS 11.0, OSX 10.12.2, *)
public class BiometricAuthenticationService: AuthenticationService {
    
    
    // MARK: - Initialization
    
    public init() {}
    
    
    // MARK: - Properties
    
    private let policy = LAPolicy.deviceOwnerAuthenticationWithBiometrics
    
    
    // MARK: - Public functions
    
    /**
     Authenticate the user for a certain authentication type,
     provided that the service can authenticate the user for
     the provided authentication type.
     
     `reason` can be used to display information to the user.
     */
    public func authenticateUser(for auth: Authentication, reason: String, completion: @escaping AuthCompletion) {
        guard canAuthenticateUser(for: auth) else { return completion(.failure(AuthError.unsupportedAuthentication)) }
        performAuthentication(for: auth, reason: reason) { result in
            DispatchQueue.main.async { completion(result) }
        }
    }
    
    /**
     Check if the service instance can authenticate the user
     for a certain authentication type.
     */
    public func canAuthenticateUser(for auth: Authentication) -> Bool {
        var error: NSError?
        return LAContext().canEvaluatePolicy(policy, error: &error)
    }
    
    /**
     Authenticate the user for a certain authentication type,
     regardless of if this service can authenticate the user
     for the provided authentication type or not.
     
     This is a way to bypass any particular rules and states
     of the service and is not part of the service protocol.
     */
    public func performAuthentication(for auth: Authentication, reason: String, completion: @escaping AuthCompletion) {
        LAContext().evaluatePolicy(policy, localizedReason: reason) { result, error in
            if let error = error { return completion(.failure(error)) }
            if result == false { return completion(.failure(AuthError.authenticationFailed)) }
            completion(.success(()))
        }
    }
}
#endif
