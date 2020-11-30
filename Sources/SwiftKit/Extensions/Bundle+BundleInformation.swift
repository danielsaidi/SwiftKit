//
//  Bundle+BundleInformation.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 These extensions make `Bundle` imlement `BundleInformation`.
 */
extension Bundle: BundleInformation {
    
    public var buildNumber: String {
        let key = String(kCFBundleVersionKey)
        let version = infoDictionary?[key] as? String
        return version ?? ""
    }
    
    public var versionNumber: String {
        let key = "CFBundleShortVersionString"
        let version = infoDictionary?[key] as? String
        return version ?? "0.0.0"
    }
}
