//
//  Result+Utils.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-04-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//
// https://danielsaidi.com/blog/2020/06/03/result-utils
//

import Foundation

@available(*, deprecated, message: "Use async code instead.")
public extension Result {
    
    /// Get the failure error, if any.
    var failureError: Failure? {
        switch self {
        case .failure(let error): return error
        case .success: return nil
        }
    }
    
    /// Check whether or not the result is a failure result.
    var isFailure: Bool { !isSuccess }
    
    /// Check whether or not the result is a success result.
    var isSuccess: Bool {
        switch self {
        case .failure: return false
        case .success: return true
        }
    }
    
    /// Get the success result, if any.
    var successResult: Success? {
        switch self {
        case .failure: return nil
        case .success(let value): return value
        }
    }
}
