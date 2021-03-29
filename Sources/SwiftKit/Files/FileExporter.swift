//
//  FileExporter.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-02-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by any classes that can be
 used to export data to the file system.
 */
public protocol FileExporter {
    
    typealias Completion = (Result<URL, Error>) -> Void
    
    /**
     Delete a previously exported file.
     
     This function should be called when you are done with a
     file, to avoid that the file system fills up with files
     that are no longer used.
     */
    func deleteFile(named fileName: String)
    
    /**
     Export the provided data to a certain file.
     
     The resulting file url will depend on the file exporter
     implementation. For instance, the `StandardFileExporter`
     will store the file in the specified directory.
     */
    func export(data: Data, to fileName: String, completion: @escaping Completion)
}
