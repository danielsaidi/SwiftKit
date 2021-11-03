//
//  AuthenticationServiceError.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-04-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This enum represents various authentication errors that can
 occur while a user is being authenticated.
 */
public enum AuthenticationServiceError: Error, Equatable {
    
    /**
     The authentication failed.
     */
    case authenticationFailed
    
    /**
     The authentication failed with a certain error message.
     */
    case authenticationFailedWithErrorMessage(String)
    
    /**
     The requested authentication type is not supported.
     */
    case unsupportedAuthentication
}
