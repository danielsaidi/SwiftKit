//
//  AuthenticationService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by authenticating services
 that can authenticate the current user in various ways.
 */
public protocol AuthenticationService: AnyObject {
    
    typealias AuthCompletion = (_ result: AuthResult) -> ()
    typealias AuthError = AuthenticationServiceError
    typealias AuthResult = Result<Void, Error>
    
    /**
     Authenticate a certain authentication. `reason` can be used
     to display information to the user.
     */
    func authenticate(_ auth: Authentication, reason: String, completion: @escaping AuthCompletion)
    
    /**
     Check if the service can be used to authenticate a certain
     authentication type.
     */
    func canAuthenticate(_ auth: Authentication) -> Bool
}
