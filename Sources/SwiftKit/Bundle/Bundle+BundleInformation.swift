//
//  Bundle+BundleInformation.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This extensions make `Bundle` implement ``BundleInformation``.
 */
extension Bundle: BundleInformation {
    
    /**
     Get the bundle build number, e.g. `42567`.
     */
    public var buildNumber: String {
        let key = String(kCFBundleVersionKey)
        let version = infoDictionary?[key] as? String
        return version ?? ""
    }
    
    /**
     Get the bundle display name, if any.
     */
    public var displayName: String {
        infoDictionary?["CFBundleDisplayName"] as? String ?? "-"
    }
    
    /**
     Get the bundle build number, e.g. `42567`.
     */
    public var versionNumber: String {
        let key = "CFBundleShortVersionString"
        let version = infoDictionary?[key] as? String
        return version ?? "0.0.0"
    }
}
