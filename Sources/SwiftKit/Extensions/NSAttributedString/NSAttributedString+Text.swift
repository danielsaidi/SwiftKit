//
//  NSAttributedString+Text.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-11-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

public extension NSAttributedString {
    
    /**
     Try to create an attributed string with `data` that has
     plain, .utf8 encoded string content.
     */
    convenience init?(plainTextData data: Data) throws {
        let decoded = String(data: data, encoding: .utf8)
        guard let string = decoded else { return nil }
        let attributed = NSAttributedString(string: string)
        self.init(attributedString: attributed)
    }
    
    /**
     Try to generate plain text data from the string.
     */
    func getPlainTextData() throws -> Data {
        guard let data = string.data(using: .utf8) else {
            throw NSAttributedStringPlainTextError
                .invalidPlainTextData(inString: string)
        }
        return data
    }
}

public enum NSAttributedStringPlainTextError: Error {
    
    case invalidPlainTextData(inString: String)
}
