//
//  Validator.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol Validator {
    
    associatedtype Validation
    
    func validate(_ obj: Validation) -> Bool
}
