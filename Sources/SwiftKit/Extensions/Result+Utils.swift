//
//  Result+Utils.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-04-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Result {
    
    /**
     Get the failure error, if any.
     */
    var failureError: Failure? {
        switch self {
        case .failure(let error): return error
        case .success: return nil
        }
    }
    
    /**
     Check whether or not the result is a failure result.
     */
    var isFailure: Bool {
        switch self {
        case .failure: return true
        case .success: return false
        }
    }
    
    /**
     Check whether or not the result is a success result.
     */
    var isSuccess: Bool {
        switch self {
        case .failure: return false
        case .success: return true
        }
    }
    
    /**
     Get the success result, if any.
    */
    var successResult: Success? {
        switch self {
        case .failure: return nil
        case .success(let value): return value
        }
    }
}
