//
//  StandardFileDirectoryService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-12-19.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This is a standard implementation of the `DirectoryService`.
 You can inherit and override any parts of it.
 */
open class StandardDirectoryService: DirectoryService {
    
    
    // MARK: - Initialization
    
    public init?(
        directory: FileManager.SearchPathDirectory,
        fileManager: FileManager = .default) {
        guard let dir = fileManager.urls(for: directory, in: .userDomainMask).last else { return nil }
        self.directoryUrl = dir
        self.fileManager = fileManager
    }
    
    public init(
        fileManager: FileManager = .default,
        directoryUrl: URL) {
        self.directoryUrl = directoryUrl
        self.fileManager = fileManager
    }
    
    
    // MARK: - Properties
    
    public let directoryUrl: URL
    private let fileManager: FileManager
    
    
    // MARK: - Public Functions
    
    open func createFile(named name: String, contents: Data?) -> Bool {
        let url = directoryUrl.appendingPathComponent(name)
        return fileManager.createFile(atPath: url.path, contents: contents, attributes: nil)
    }
    
    open func fileExists(withName name: String) -> Bool {
        getUrlForFile(named: name) != nil
    }
    
    open func getAttributesForFile(named name: String) -> [FileAttributeKey: Any]? {
        guard let url = getUrlForFile(named: name) else { return nil }
        return try? fileManager.attributesOfItem(atPath: url.path)
    }
    
    open func getFileNames() -> [String] {
        guard let urls = try? fileManager.contentsOfDirectory(at: directoryUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles) else { return [] }
        return urls.map { $0.lastPathComponent }
    }
    
    open func getFileNames(matching fileNamePatterns: [String]) -> [String] {
        let patterns = fileNamePatterns.map { $0.lowercased() }
        return getFileNames().filter {
            let fileName = $0.lowercased()
            return patterns.filter { fileName.contains($0) }.first != nil
        }
    }
    
    open func getSizeOfAllFiles() -> UInt64 {
        getFileNames().reduce(0) { $0 + (getSizeOfFile(named: $1) ?? 0) }
    }
    
    open func getSizeOfFile(named name: String) -> UInt64? {
        guard let attributes = getAttributesForFile(named: name) else { return nil }
        let number = attributes[FileAttributeKey.size] as? NSNumber
        return number?.uint64Value
    }
    
    open func getUrlForFile(named name: String) -> URL? {
        let urls = try? fileManager.contentsOfDirectory(at: directoryUrl, includingPropertiesForKeys: nil)
        return urls?.first { $0.lastPathComponent == name }
    }
    
    open func getUrlsForAllFiles() -> [URL] {
        getFileNames().compactMap {
            getUrlForFile(named: $0)
        }
    }
    
    open func removeFile(named name: String) throws {
        guard let url = getUrlForFile(named: name) else { return }
        try fileManager.removeItem(at: url)
    }
}
