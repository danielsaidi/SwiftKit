//
//  BundleInformation.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol BundleInformation {

    var buildNumber: String { get }
    var gitCommitHash: String { get }
    var versionNumber: String { get }
}
