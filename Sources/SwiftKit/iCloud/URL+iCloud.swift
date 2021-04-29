//
//  URL+iCloud.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-04-17.
//  Copyright 2021 Daniel Saidi. All rights reserved.
//

import Foundation

public extension URL {
    
    /**
     The url to the iCloud ubiquity container.
     */
    static func ubiquityContainer(
        for manager: FileManager = .default,
        containerId: String? = nil) -> URL? {
        manager.url(forUbiquityContainerIdentifier: nil)
    }
    
    /**
     The url to the iCloud ubiquity container Documents root.
     */
    static func ubiquityContainerDocuments(
        for manager: FileManager = .default,
        containerId: String? = nil) -> URL? {
        ubiquityContainer(for: manager, containerId: containerId)?
            .appendingPathComponent("Documents")
    }
}
