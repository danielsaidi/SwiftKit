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
     The url to the iCloud ubiquity container. This is where
     documents and data will be saved and synced with iCloud.
     */
    static func ubiquityContainer(
        for manager: FileManager = .default,
        containerId: String? = nil) -> URL? {
        manager.url(forUbiquityContainerIdentifier: nil)
    }
    
    /**
     The url to the iCloud ubiquity container Documents root,
     where documents will be saved and synced with iCloud.
     */
    static func ubiquityContainerDocuments(
        for manager: FileManager = .default,
        containerId: String? = nil) -> URL? {
        ubiquityContainer(for: manager, containerId: containerId)?
            .appendingPathComponent("Documents")
    }
    
    /**
     The url to a local document fallback directory that can
     be used when the `ubiquityContainer` urls are nil.
     */
    static func ubiquityContainerDocumentsLocalFallbackDirectory(
        for manager: FileManager = .default) -> URL? {
        manager.urls(for: .documentDirectory, in: .userDomainMask).first
    }
}
