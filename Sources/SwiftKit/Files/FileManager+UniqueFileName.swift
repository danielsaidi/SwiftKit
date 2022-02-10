//
//  FileManager+UniqueFileName.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2022-01-18.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import Foundation

public extension FileManager {
    
    /**
     Get a unique destination for a certain destination file
     URL, to ensure that no existing files are replaced.
     
     For instance, if you have a destination url, and a file
     already exists at that url, this function will add `-1`
     to the file name and check if such a file exists. If it
     doesn't the function will return the new url, otherwise
     try with `-2`, `-3` etc. until no file exists.
     */
    func getUniqueDestinationUrl(
        for destinationUrl: URL,
        separator: String = "-") -> URL {
        if !fileExists(atPath: destinationUrl.path) { return destinationUrl }
        let fileExtension = destinationUrl.pathExtension
        let noExtension = destinationUrl.deletingPathExtension()
        let fileName = noExtension.lastPathComponent
        var counter = 1
        repeat {
            let newUrl = noExtension
                .deletingLastPathComponent()
                .appendingPathComponent(fileName.appending("\(separator)\(counter)"))
                .appendingPathExtension(fileExtension)
            if !fileExists(atPath: newUrl.path) { return newUrl }
            counter += 1
        } while true
    }
}
