//
//  NSAttributedString+Rtf.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-11-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

public extension NSAttributedString {
    
    /**
     Try to create an attributed string with `data` that has
     RTF formatted string content.
     
     This extension aims to simplify the chore of creating a
     proper attributed string from RTF data, since the Swift
     api:s are old and requires a lot or bridging.
     */
    convenience init(rtfData data: Data) throws {
        let docTypeKey = NSAttributedString.DocumentReadingOptionKey.documentType
        let rtfDocument = NSAttributedString.DocumentType.rtf
        var attributes = [docTypeKey: rtfDocument] as NSDictionary?
        try self.init(
            data: data,
            options: [.characterEncoding: String.Encoding.utf8.rawValue],
            documentAttributes: &attributes)
    }
    
    /**
     Try to generate RTF data from the attributed string.
     */
    func getRtfData() throws -> Data {
        let docTypeKey = NSAttributedString.DocumentAttributeKey.documentType
        let rtfDocument = NSAttributedString.DocumentType.rtf
        let attributes = [docTypeKey: rtfDocument]
        let data = try data(
            from: NSRange(location: 0, length: length),
            documentAttributes: attributes)
        return data
    }
}
