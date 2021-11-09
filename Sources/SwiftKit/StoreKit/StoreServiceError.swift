//
//  StoreServiceError.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-11-08.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation
import StoreKit

/**
 This enum lists errors that can be thrown by store services.
 */
@available(iOS 15.0, macOS 12.0, watchOS 8.0, tvOS 15.0, *)
public enum StoreServiceError: Error {
    
    /// This is thrown if a transaction can't be verified.
    case invalidTransaction(Transaction, VerificationResult<Transaction>.VerificationError)
}
