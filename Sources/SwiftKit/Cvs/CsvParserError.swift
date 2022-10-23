//
//  CsvParserError.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2018-10-23.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This error can be thrown while parsing a csv string or file.
 */
public enum CsvParserError: Error {

    /// The requested file doesn't exist.
    case noFileWithName(_ fileName: String, andExtension: String, inBundle: Bundle)
}
