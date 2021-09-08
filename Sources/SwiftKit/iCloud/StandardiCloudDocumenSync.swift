//
//  StandardiCloudDocumentSync.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-04-29.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This class can be used to sync iCloud document changes in a
 shared uqibuity container.
 
 Note that you must have setup iCloud entitlements and added
 an iCloud node to Info.plist. All apps that should sync any
 documents must belong to the same ubiquity container and be
 identically configured.
 */
public class StandardiCloudDocumentSync: iCloudDocumentSync {
    
    public init(
        filePattern: String,
        fileManager: FileManager = .default,
        notificationCenter: NotificationCenter = .default) {
        self.filePattern = filePattern
        self.fileManager = fileManager
        self.notificationCenter = notificationCenter
    }
        
    private let filePattern: String
    private let fileManager: FileManager
    private let notificationCenter: NotificationCenter
    
    private lazy var metadataQuery: NSMetadataQuery = {
        let metadataQuery = NSMetadataQuery()
        metadataQuery.notificationBatchingInterval = 1
        metadataQuery.searchScopes = [NSMetadataQueryUbiquitousDataScope, NSMetadataQueryUbiquitousDocumentsScope]
        metadataQuery.predicate = NSPredicate(format: "%K LIKE %@", NSMetadataItemFSNameKey, filePattern)
        metadataQuery.sortDescriptors = [NSSortDescriptor(key: NSMetadataItemFSNameKey, ascending: true)]
        let selector = #selector(handleQueryNotification)
        notificationCenter.addObserver(self, selector: selector, name: .NSMetadataQueryDidUpdate, object: metadataQuery)
        notificationCenter.addObserver(self, selector: selector, name: .NSMetadataQueryDidFinishGathering, object: metadataQuery)
        return metadataQuery
    }()
    
    /**
     Start syncing iCloud document changes.
     */
    public func startSyncingChanges() {
        metadataQuery.start()
    }
    
    /**
     Stop syncing iCloud document changes.
     */
    public func stopSyncingChanges() {
        notificationCenter.removeObserver(self)
    }
}

@objc private extension StandardiCloudDocumentSync {
    
    func handleQueryNotification(notification: Notification?) {
        guard let metadataQuery = notification?.object as? NSMetadataQuery else { return }
        metadataQuery.disableUpdates()
        metadataQuery.enumerateResults { item, _, _ in
            handleQueryItem(item)
        }
        metadataQuery.enableUpdates()
    }
    
    func handleQueryItem(_ item: Any) {
        guard
            let metadataItem = item as? NSMetadataItem,
            !isMetadataItemDownloaded(for: metadataItem),
            let url = metadataItem.value(forAttribute: NSMetadataItemURLKey) as? URL
        else { return }
        try? fileManager.startDownloadingUbiquitousItem(at: url)
    }
    
    func isMetadataItemDownloaded(for item: NSMetadataItem) -> Bool {
        let statusKey = item.value(forAttribute: NSMetadataUbiquitousItemDownloadingStatusKey)
        return statusKey as? String == NSMetadataUbiquitousItemDownloadingStatusDownloaded
    }
}
