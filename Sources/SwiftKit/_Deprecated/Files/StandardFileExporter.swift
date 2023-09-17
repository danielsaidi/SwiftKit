//
//  StandardFileExporter.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-02-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "This will be removed in SwiftKit 2.0")
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
    
    /**
     Delete a previously exported file.
     
     This function should be called when you are done with a
     file, to avoid that the file system fills up with files
     that are no longer used.
     */
    public func deleteFile(named fileName: String) {
        guard let url = getFileUrl(forFileName: fileName) else { return }
        try? fileManager.removeItem(at: url)
    }
    
    /**
     Export the provided data to a certain file.
     
     The resulting file url will depend on the file exporter
     implementation. For instance, the `StandardFileExporter`
     will store the file in the specified directory.
     */
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
