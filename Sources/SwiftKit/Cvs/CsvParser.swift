//
//  CsvParser.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2018-10-23.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by classes that can handle
 parsing of comma-separated value files and strings.

 When parsing a csv file or string, every line will be split
 up into components using the provided `componentSeparator`.
 */
public protocol CsvParser {

    /**
     Parse a csv file in a certain bundle.

     - Parameters:
       - fileName: The name of the file to parse.
       - fileExtension: The extension of the file to parse.
       - bundle: The bundle in which the file is located.
       - componentSeparator: The separator that separates components on each line.
     */
    func parseCsvFile(
        named fileName: String,
        withExtension fileExtension: String,
        in bundle: Bundle,
        componentSeparator: Character
    ) throws -> [[String]]

    /**
     Parse a csv file at a certain url.

     - Parameters:
       - url: The url of the file to parse.
       - componentSeparator: The separator that separates components on each line.
     */
    func parseCsvFile(
        at url: URL,
        componentSeparator: Character
    ) throws -> [[String]]

    /**
     Parse the provided csv string.

     - Parameters:
       - string: The string to parse.
       - componentSeparator: The separator that separates components on each line.
     */
    func parseCsvString(
        _ string: String,
        componentSeparator: Character
    ) -> [[String]]
}
