//
//  FileDirectoryService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-12-19.
//  Copyright © 2020 Daniel Saidi. All rights reserved.

import Foundation

/**
 This service can be implemented by classes that can be used
 to handle files within a certain local file directory.
 */
public protocol DirectoryService: AnyObject {
    
    var directoryUrl: URL { get }
    
    func createFile(named name: String, contents: Data?) -> Bool
    func fileExists(withName name: String) -> Bool
    func getAttributesForFile(named name: String) -> [FileAttributeKey: Any]?
    func getFileNames() -> [String]
    func getFileNames(matching fileNamePatterns: [String]) -> [String]
    func getSizeOfAllFiles() -> UInt64
    func getSizeOfFile(named name: String) -> UInt64?
    func getUrlForFile(named name: String) -> URL?
    func getUrlsForAllFiles() -> [URL]
    func removeFile(named name: String) throws
}
