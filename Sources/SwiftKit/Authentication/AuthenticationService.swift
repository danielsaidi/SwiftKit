//
//  AuthenticationService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by any classes that can be
 used to authenticate the user.
 */
public protocol AuthenticationService: AnyObject {
    
    typealias AuthCompletion = (_ result: AuthResult) -> Void
    typealias AuthError = AuthenticationServiceError
    typealias AuthResult = Result<Void, Error>
    
    /**
     Authenticate the user for a certain ``Authentication``.
     
     - Parameters:
       - auth: The authentication type to evaluate.
       - reason: The localized reason to show to the user.
       - completion: The completion block to call once authentication is done.
     */
    func authenticateUser(
        for auth: Authentication,
        reason: String,
        completion: @escaping AuthCompletion)
    
    /**
     Whether or not the service can authenticate the current
     user for a certain ``Authentication`` type.
     
     - Parameters:
       - auth: The authentication type to evaluate.
     */
    func canAuthenticateUser(for auth: Authentication) -> Bool
}
