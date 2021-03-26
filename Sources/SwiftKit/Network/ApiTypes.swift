//
//  ApiTypes.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-09-30.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This completion type is used by the `ApiService` protocol.
 */
public typealias ApiCompletion<T> = (ApiResult<T>) -> Void

/**
 This enum contains errors that can occur when communicating
 with an api, using an `ApiService`.
 */
public enum ApiError: Error {
    
    case invalidData(Data, HTTPURLResponse, Error)
    case invalidResponse(Data?, HTTPURLResponse?, Error?)
    case invalidUrl(URL)
}

/**
 This result type is used by the `ApiCompletion`.
 */
public typealias ApiResult<T> = Result<T, Error>
