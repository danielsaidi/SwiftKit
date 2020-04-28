//
//  AuthenticationServiceError.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-04-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This enum represents possible authentication service errors.
 */
public enum AuthenticationServiceError: Error, Equatable {
    
    case unsupportedAuthentication
}
