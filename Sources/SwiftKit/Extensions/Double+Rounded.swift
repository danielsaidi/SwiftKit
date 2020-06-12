//
//  Double+Rounded.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Double {

    /**
     The value rounded to a certain number of decimals.
     */
    func roundedWithDecimals(_ decimals: Int) -> Double {
        let divisor = pow(10.0, Double(decimals))
        return (self * divisor).rounded() / divisor
    }
    
    /**
     The value rounded to the decimal precision of a certain
     reference value.
     
     `TODO` This currently fails for a higher precision. See
     the unit tests for an example of a failing precision.     
    */
    func roundedWithPrecision(from value: Double) -> Double {
        let stepSize = Decimal(value)
        let exponent = abs(min(0, stepSize.exponent))
        let multiplier = Decimal(sign: .plus, exponent: exponent, significand: 1)
        let multipliedValue = (self * multiplier.doubleValue).rounded()
        let multipliedStepSize = (stepSize.doubleValue * multiplier.doubleValue).rounded()
        let multipliedRemined =  multipliedValue.truncatingRemainder(dividingBy: multipliedStepSize)
        let remainder = Decimal(multipliedRemined) / multiplier
        let offset = remainder.isZero ? 0 : stepSize - remainder
        let result = Decimal(multipliedValue) / multiplier + offset
        return result.doubleValue
    }
}
