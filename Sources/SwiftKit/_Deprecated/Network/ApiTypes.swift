//
//  ApiTypes.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-09-30.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/// [DEPRECATED] Use ApiKit instead
public typealias ApiCompletion<T> = (ApiResult<T>) -> Void

/// [DEPRECATED] Use ApiKit instead
public enum ApiError: Error {
    
    case invalidData(Data, HTTPURLResponse, Error)
    case invalidResponse(Data?, HTTPURLResponse?, Error?)
    case invalidUrl(URL)
}

/// [DEPRECATED] Use ApiKit instead
public typealias ApiResult<T> = Result<T, Error>
