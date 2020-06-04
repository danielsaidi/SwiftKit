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
 */
public protocol CsvParser {
    
    func parseCvsFile(named fileName: String, withExtension ext: String, in bundle: Bundle, separator: Character) throws -> [[String]]
    func parseCvsString(_ string: String, separator: Character) -> [[String]]
}

public enum CsvParserError: Error {
    
    case invalidDataInFile(_ fileName: String, fileExtension: String)
    case noSuchFile(_ fileName: String, fileExtension: String)
}
