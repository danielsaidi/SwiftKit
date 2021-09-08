//
//  StandardCsvParser.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2018-10-23.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public class StandardCsvParser: CsvParser {
    
    public init() {}
    
    /**
     Parse a CVS file with a certain name and extension in a
     certain bundle.
     
     The file content will be parsed line by line, splitting
     each line using the provided `separator`.
     */
    public func parseCvsFile(
        named fileName: String,
        withExtension ext: String,
        in bundle: Bundle,
        separator: Character) throws -> [[String]] {
        let missingFile = CsvParserError.noSuchFile(fileName, fileExtension: ext)
        let invalidData = CsvParserError.invalidDataInFile(fileName, fileExtension: ext)
        guard let path = bundle.path(forResource: fileName, ofType: ext) else { throw missingFile }
        guard let string = try? String(contentsOfFile: path, encoding: .utf8) else { throw invalidData }
        return parseCvsString(string, separator: separator)
    }
    
    /**
     Parse a CVS string line by line, splitting up each line
     using the provided `separator`.
     */
    public func parseCvsString(
        _ string: String,
        separator: Character) -> [[String]] {
        let allRows = string.components(separatedBy: .newlines)
        let rows = allRows.filter { $0.trimmingCharacters(in: .whitespaces).count > 0 }
        return rows.map { $0.split(separator: separator).map { String($0) } }
    }
}
