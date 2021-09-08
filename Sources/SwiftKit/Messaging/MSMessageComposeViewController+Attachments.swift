//
//  MFMessageComposeViewController+Attachments.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-03-26.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import MessageUI

public extension MFMessageComposeViewController {
    
    /**
     Add a data attachment using a custom `fileName`.
     */
    func addAttachmentData(data: Data, fileName: String) {
        addAttachmentData(data, typeIdentifier: "public.data", filename: fileName)
    }
}
#endif
