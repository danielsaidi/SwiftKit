//
//  BundleInformation.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "Just use the corresponding bundle extensions.")
extension Bundle: BundleInformation {}

@available(*, deprecated, message: "Just use the corresponding bundle extensions.")
public protocol BundleInformation {
    
    /// Get the bundle build number, e.g. `42567`.
    var buildNumber: String { get }
    
    /// Get the bundle display name, if any.
    var displayName: String { get }
    
    /// Get the bundle build number, e.g. `42567`.
    var versionNumber: String { get }
}
