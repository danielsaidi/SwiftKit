//
//  LAContext+Async.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2022-04-29.
//  Copyright © 2016-2022 Daniel Saidi. All rights reserved.
//

import LocalAuthentication

@available(iOS 15.0, macOS 12.0, *)
extension LAContext {
    
    /**
     Evaluate a certain policy.
     
     - Parameters:
       - policy: The policy to evaluate.
       - localizedReason: The localized reason to show to the user.
     */
    func evaluatePolicy(_ policy: LAPolicy, localizedReason reason: String) async throws -> Bool {
        return try await withCheckedThrowingContinuation { cont in
            LAContext().evaluatePolicy(policy, localizedReason: reason) { result, error in
                if let error = error { return cont.resume(throwing: error) }
                cont.resume(returning: result)
            }
        }
    }
}
