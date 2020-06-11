//
//  Bundle+BundleInformation.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

extension Bundle: BundleInformation {}

public extension Bundle {
    
    var buildNumber: String {
        let key = String(kCFBundleVersionKey)
        let version = infoDictionary?[key] as? String
        return version ?? ""
    }
    
    var gitCommitHash: String {
        let key = "GitCommitHash"
        let commitHash = infoDictionary?[key] as? String
        return commitHash ?? ""
    }
    
    var versionNumber: String {
        let key = "CFBundleShortVersionString"
        let version = infoDictionary?[key] as? String
        return version ?? "0.0.0"
    }
}
