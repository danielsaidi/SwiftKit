//
//  ApiError.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-09-30.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This enum has errors that can occur in an `ApiServiceError`.
 */
public enum ApiServiceError: Error {
    
    case invalidData(Data, Error)
    case invalidResponse
    case invalidUrl(URL)
    case missingData
    case statusCode(Int)
}
