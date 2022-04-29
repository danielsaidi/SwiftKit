//
//  LocalAuthenticationService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2022-04-29.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import LocalAuthentication

/**
 This service uses `LocalAuthentication` to authenticate the
 current user.
 */
open class LocalAuthenticationService: AuthenticationService {
    
    /**
     Create a service instance.

     - Parameters:
       - policy: The authentication policy to use.
     */
    public init(policy: LAPolicy) {
        self.policy = policy
    }
    
    
    private let policy: LAPolicy
    
    
    /**
     Authenticate the user for a certain ``Authentication``.
     
     - Parameters:
       - auth: The authentication type to evaluate.
       - reason: The localized reason to show to the user.
     */
    open func authenticateUser(for auth: Authentication, reason: String, completion: @escaping AuthCompletion) {
        guard canAuthenticateUser(for: auth) else { return completion(.failure(AuthError.unsupportedAuthentication)) }
        performAuthentication(for: auth, reason: reason) { result in
            DispatchQueue.main.async { completion(result) }
        }
    }
    
    /**
     Check if the service instance can authenticate the user
     for a certain ``Authentication``.
     
     For biometric authentication, a user can disable system
     authentication for an app, which means that the service
     can no longer fulfill it's intended use.
     
     - Parameters:
       - auth: The authentication type to evaluate.
     */
    open func canAuthenticateUser(for auth: Authentication) -> Bool {
        var error: NSError?
        return LAContext().canEvaluatePolicy(policy, error: &error)
    }
    
    /**
     Authenticate the user for a certain `` authentication type,
     regardless of if this service can authenticate the user
     for the provided authentication type or not.
     
     This is a way to bypass any particular rules and states
     of the service and can be used to e.g. mock .
     */
    open func performAuthentication(for auth: Authentication, reason: String, completion: @escaping AuthCompletion) {
        LAContext().evaluatePolicy(policy, localizedReason: reason) { result, error in
            if let error = error { return completion(.failure(error)) }
            if result == false { return completion(.failure(AuthError.authenticationFailed)) }
            completion(.success(()))
        }
    }
}
#endif

