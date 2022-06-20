//
//  MFMailComposeViewController+Attachments.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-03-26.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import MessageUI

@available(*, deprecated, message: "This extension has been deprecated and will be removed in the next major version.")
public extension MFMailComposeViewController {
    
    /**
     Add a data attachment using a `mimeType` and `fileName`.
     */
    func addAttachmentData(data: Data, mimeType: MimeType, fileName: String) {
        addAttachmentData(data, mimeType: mimeType.identifier, fileName: fileName)
    }
}
#endif
