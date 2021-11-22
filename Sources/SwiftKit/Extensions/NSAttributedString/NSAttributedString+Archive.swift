//
//  NSAttributedString+Archive.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-11-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

public extension NSAttributedString {
    
    /**
     Try to create an attributed string with `data` that was
     created with an `NSKeyedArchiver`.
     */
    convenience init?(keyedArchiveData data: Data) throws {
        let res = try NSKeyedUnarchiver.unarchivedObject(
            ofClass: NSAttributedString.self,
            from: data)
        guard let string = res else { return nil }
        self.init(attributedString: string)
    }
    
    /**
     Try to generate `NSKeyedArchiver` data from the string.
     */
    func getKeyedArchiveData() throws -> Data {
        try NSKeyedArchiver.archivedData(
            withRootObject: self,
            requiringSecureCoding: false)
    }
}
