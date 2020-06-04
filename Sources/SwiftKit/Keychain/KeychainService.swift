//
//  KeychainService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by keychain-based services
 that can read from and write to the device keychain.
 */
public protocol KeychainService: KeychainReader, KeychainWriter { }
