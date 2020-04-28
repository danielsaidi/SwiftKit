//
//  MockAuthenticationService.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-04-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Mockery
import SwiftKit

class MockAuthenticationService: Mock, AuthenticationService {
    
    var authError: Error?
    
    func authenticate(_ auth: Authentication, reason: String, completion: @escaping AuthCompletion) {
        invoke(authenticate, args: (auth, reason, completion))
        if let error = authError { return completion(.failure(error)) }
        completion(.success(()))
    }
    
    func canAuthenticate(_ auth: Authentication) -> Bool {
        invoke(canAuthenticate, args: (auth))
    }
}
