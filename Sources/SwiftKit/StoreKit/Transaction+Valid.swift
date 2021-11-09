//
//  Transaction+Valid.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-11-08.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import StoreKit

@available(iOS 15.0, macOS 12.0, watchOS 8.0, tvOS 15.0, *)
extension Transaction {
    
    /**
     Whether or not the transaction is valid.
     
     The logic may have to be adjusted as more product types
     are handled with this service.
     */
    var isValid: Bool {
        if revocationDate != nil { return false }
        guard let date = expirationDate else { return false }
        return date > Date()
    }
}
