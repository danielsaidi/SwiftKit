//
//  ApiModel.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-09-30.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by any api model, that can
 be fetched from an api and converted to a local model. This
 enforces separating your api models from the models used in
 your app.
 */
public protocol ApiModel: Decodable {
    
    associatedtype LocalModel
    
    func convert() -> LocalModel
}
