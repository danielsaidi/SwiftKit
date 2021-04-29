//
//  iCloudDocumentSync.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-04-29.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by any classes that can be
 used to sync iCloud document changes.
 */
public protocol iCloudDocumentSync {
    
    /**
     Start syncing iCloud document changes.
     */
    func startSyncingChanges()
    
    /**
     Stop syncing iCloud document changes.
     */
    func stopSyncingChanges()
}
