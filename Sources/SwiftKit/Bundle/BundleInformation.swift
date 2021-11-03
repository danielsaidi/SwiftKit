//
//  BundleInformation.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by types that can provide information about the current bundle.
 */
public protocol BundleInformation {
    
    /**
     Get the bundle build number, e.g. `42567`.
     */
    var buildNumber: String { get }
    
    /**
     Get the bundle display name, if any.
     */
    var displayName: String { get }
    
    /**
     Get the bundle build number, e.g. `42567`.
     */
    var versionNumber: String { get }
}
