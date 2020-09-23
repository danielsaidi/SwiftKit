//
//  Numeric+Conversions.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import CoreGraphics

public extension CGFloat {
    
    func toDouble() -> Double { Double(self) }
    func toFloat() -> Float { Float(self) }
    func toInt() -> Int { Int(self) }
}

public extension Double {
    
    func toCGFloat() -> CGFloat { CGFloat(self) }
    func toFloat() -> Float { Float(self) }
    func toInt() -> Int { Int(self) }
}

public extension Float {
    
    func toCGFloat() -> CGFloat { CGFloat(self) }
    func toDouble() -> Double { Double(self) }
    func toInt() -> Int { Int(self) }
}

public extension Int {
    
    func toCGFloat() -> CGFloat { CGFloat(self) }
    func toDouble() -> Double { Double(self) }
    func toFloat() -> Float { Float(self) }
}
