//
//  NumberFormatter+Init.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2022-10-19.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import Foundation

public extension NumberFormatter {

    /**
     Create number formatter with a certain locale and style.

     The initializer will default to US English to make sure
     that we by default get the default Qapital locale.

     - Parameters:
       - numberStyle: The number style to use.
       - fixedDecimals: The number of fixed decimals to use, if any, by default `nil`.
       - locale: The locale to use, by default `en-US`.
     */
    convenience init(
        numberStyle: NumberFormatter.Style,
        fixedDecimals: Int? = nil,
        locale: Locale = Locale(identifier: "en-US")
    ) {
        self.init()
        self.numberStyle = numberStyle
        if let decimals = fixedDecimals {
            minimumFractionDigits = decimals
            maximumFractionDigits = decimals
        }
        self.locale = locale
    }
}

public extension NumberFormatter {

    /// A percent formatter with a fixed number of decimals.
    static func percent(decimals: Int) -> NumberFormatter {
        NumberFormatter(
            numberStyle: .percent,
            fixedDecimals: decimals
        )
    }
}
