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
    
    public func parseCvsString(
        _ string: String,
        separator: Character) -> [[String]] {
        let allRows = string.components(separatedBy: .newlines)
        let rows = allRows.filter { $0.trimmingCharacters(in: .whitespaces).count > 0 }
        return rows.map { $0.split(separator: separator).map { String($0) } }
    }
    
    public func parseCvsFile(
        named fileName: String,
        withExtension ext: String,
        in bundle: Bundle,
        separator: Character) throws -> [[String]] {
        let url = bundle.url(forResource: fileName, withExtension: ext)
        guard let fileUrl = url else { throw CsvParserError.noSuchFile(fileName, fileExtension: ext) }
        let data = try Data(contentsOf: fileUrl)
        guard let string = String(data: data, encoding: .utf8) else { throw CsvParserError.invalidDataInFile(fileName, fileExtension: ext) }
        return parseCvsString(string, separator: separator)
    }
}
