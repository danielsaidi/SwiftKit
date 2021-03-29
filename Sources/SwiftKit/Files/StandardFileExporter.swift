//
//  StandardFileExporter.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-02-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This file exporter can export data to the file system using
 a file manager and a certain directory.
 */
public class StandardFileExporter: FileExporter {
    
    public init(
        fileManager: FileManager = .default,
        directory: FileManager.SearchPathDirectory = .documentDirectory) {
        self.fileManager = fileManager
        self.directory = directory
    }
    
    private let fileManager: FileManager
    private let directory: FileManager.SearchPathDirectory
        
    public enum ExportError: Error {
        case invalidUrl
    }
    
    public func deleteFile(named fileName: String) {
        guard let url = getFileUrl(forFileName: fileName) else { return }
        try? fileManager.removeItem(at: url)
    }
    
    public func export(data: Data, to fileName: String, completion: @escaping Completion) {
        guard let url = getFileUrl(forFileName: fileName) else { return completion(.failure(ExportError.invalidUrl)) }
        tryWrite(data: data, to: url, completion: completion)
    }
}

private extension StandardFileExporter {
    
    func getFileUrl(forFileName fileName: String) -> URL? {
        fileManager.urls(for: directory, in: .userDomainMask).first?.appendingPathComponent(fileName)
    }
    
    func tryWrite(data: Data, to url: URL, completion: @escaping Completion) {
        do {
            try data.write(to: url, options: .atomicWrite)
            completion(.success(url))
        } catch {
            completion(.failure(error))
        }
    }
}
