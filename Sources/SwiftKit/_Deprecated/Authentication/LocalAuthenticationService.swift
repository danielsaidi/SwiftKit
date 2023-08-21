//
//  LocalAuthenticationService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2022-04-29.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import LocalAuthentication

@available(*, deprecated, message: "This is no longer used. Use LAContext directly instead.")
open class LocalAuthenticationService: AuthenticationService {
    
    public init(policy: LAPolicy) {
        self.policy = policy
    }
    
    
    private let policy: LAPolicy
    
    open func authenticateUser(for auth: Authentication, reason: String, completion: @escaping AuthCompletion) {
        performAuthentication(for: auth, reason: reason) { result in
            DispatchQueue.main.async { completion(result) }
        }
    }
    
    open func canAuthenticateUser(for auth: Authentication) -> Bool {
        var error: NSError?
        return LAContext().canEvaluatePolicy(policy, error: &error)
    }
    
    open func performAuthentication(for auth: Authentication, reason: String, completion: @escaping AuthCompletion) {
        LAContext().evaluatePolicy(policy, localizedReason: reason) { result, error in
            if let error = error { return completion(.failure(error)) }
            if result == false { return completion(.failure(AuthError.authenticationFailed)) }
            completion(.success(()))
        }
    }
}
#endif
