//
//  MockAuthenticationService.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-04-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import MockingKit
import SwiftKit

class MockAuthenticationService: Mock, AuthenticationService {
    
    lazy var authenticateUserRef = MockReference(authenticateUser)
    lazy var canAuthenticateUserRef = MockReference(canAuthenticateUser)
    
    var authError: Error?
    
    func authenticateUser(for auth: Authentication, reason: String, completion: @escaping AuthCompletion) {
        call(authenticateUserRef, args: (auth, reason, completion))
        if let error = authError { return completion(.failure(error)) }
        completion(.success(()))
    }
    
    func canAuthenticateUser(for auth: Authentication) -> Bool {
        call(canAuthenticateUserRef, args: (auth))
    }
}
