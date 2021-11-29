//
//  String+Characters.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-11-29.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String.Element {
    
    static var carriageReturn: String.Element { "\r" }
    static var newLine: String.Element { "\n" }
    static var tab: String.Element { "\t" }
}


public extension String {
    
    static let newLine = String(.newLine)
    static let tab = String(.tab)
}
