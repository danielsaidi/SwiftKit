//
//  Numeric+Format.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-11-15.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//
//  https://danielsaidi.com/blog/2020-06-03-numeric-string-representation
//

import Foundation

public protocol NumericStringRepresentable: CVarArg {}

extension Double: NumericStringRepresentable {}
extension Float: NumericStringRepresentable {}

public extension NumericStringRepresentable {
    
    func string(withDecimals decimals: Int) -> String {
        String(format: "%0.\(decimals)f", self)
    }
}
