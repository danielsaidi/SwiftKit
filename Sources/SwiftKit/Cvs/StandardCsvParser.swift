//
//  StandardCsvParser.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2018-10-23.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This class can be used to parse comma-separated value files
 and strings.

 When parsing a csv file or string, every line will be split
 up into components using the provided `componentSeparator`.
 */
public class StandardCsvParser: CsvParser {

    /**
     Create a parser instance.
     */
    public init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    private let fileManager: FileManager

    /**
     Parse a csv file in a certain bundle.

     - Parameters:
       - fileName: The name of the file to parse.
       - fileExtension: The extension of the file to parse.
       - bundle: The bundle in which the file is located.
       - componentSeparator: The separator that separates components on each line.
     */
    public func parseCsvFile(
        named fileName: String,
        withExtension ext: String,
        in bundle: Bundle,
        componentSeparator: Character
    ) throws -> [[String]] {
        guard let path = bundle.path(forResource: fileName, ofType: ext) else {
            throw CsvParserError.noFileWithName(fileName, andExtension: ext, inBundle: bundle)
        }
        let string = try String(contentsOfFile: path, encoding: .utf8)
        return parseCsvString(string, componentSeparator: componentSeparator)
    }

    /**
     Parse a csv file at a certain url.

     - Parameters:
       - url: The url of the file to parse.
       - componentSeparator: The separator that separates components on each line.
     */
    public func parseCsvFile(
        at url: URL,
        componentSeparator: Character
    ) throws -> [[String]] {
        let string = try String(contentsOf: url, encoding: .utf8)
        return parseCsvString(string, componentSeparator: componentSeparator)
    }

    /**
     Parse the provided csv string.

     - Parameters:
       - string: The string to parse.
       - componentSeparator: The separator that separates components on each line.
     */
    public func parseCsvString(
        _ string: String,
        componentSeparator: Character
    ) -> [[String]] {
        string
            .components(separatedBy: .newlines)
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }
            .map { $0.split(separator: componentSeparator)
                .map { String($0).trimmingCharacters(in: .whitespaces) }
            }
    }
}
