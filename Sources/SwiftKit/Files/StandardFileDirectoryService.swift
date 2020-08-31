//
//  StandardFileDirectoryService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-12-19.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public class StandardFileDirectoryService: FileDirectoryService {
    
    
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
    
    public func createFile(named name: String, contents: Data?) -> Bool {
        let url = directoryUrl.appendingPathComponent(name)
        return fileManager.createFile(atPath: url.path, contents: contents, attributes: nil)
    }
    
    public func fileExists(withName name: String) -> Bool {
        getUrlForFile(named: name) != nil
    }
    
    public func getAttributesForFile(named name: String) -> [FileAttributeKey: Any]? {
        guard let url = getUrlForFile(named: name) else { return nil }
        return try? fileManager.attributesOfItem(atPath: url.path)
    }
    
    public func getFileNames() -> [String] {
        guard let urls = try? fileManager.contentsOfDirectory(at: directoryUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles) else { return [] }
        return urls.map { $0.lastPathComponent }
    }
    
    public func getFileNames(matching fileNamePatterns: [String]) -> [String] {
        let patterns = fileNamePatterns.map { $0.lowercased() }
        return getFileNames().filter {
            let fileName = $0.lowercased()
            return patterns.filter { fileName.contains($0) }.first != nil
        }
    }
    
    public func getSizeOfAllFiles() -> UInt64 {
        getFileNames().reduce(0) { $0 + (getSizeOfFile(named: $1) ?? 0) }
    }
    
    public func getSizeOfFile(named name: String) -> UInt64? {
        guard let attributes = getAttributesForFile(named: name) else { return nil }
        let number = attributes[FileAttributeKey.size] as? NSNumber
        return number?.uint64Value
    }
    
    public func getUrlForFile(named name: String) -> URL? {
        let urls = try? fileManager.contentsOfDirectory(at: directoryUrl, includingPropertiesForKeys: nil)
        return urls?.first { $0.lastPathComponent == name }
    }
    
    public func getUrlsForAllFiles() -> [URL] {
        getFileNames().compactMap {
            getUrlForFile(named: $0)
        }
    }
    
    public func removeFile(named name: String) throws {
        guard let url = getUrlForFile(named: name) else { return }
        try fileManager.removeItem(at: url)
    }
}
