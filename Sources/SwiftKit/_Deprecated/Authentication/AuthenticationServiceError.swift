//
//  AuthenticationServiceError.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-04-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "This is no longer used. Use LAContext directly instead.")
public enum AuthenticationServiceError: Error, Equatable {
    
    case authenticationFailed
    case authenticationFailedWithErrorMessage(String)
    case unsupportedAuthentication
}
