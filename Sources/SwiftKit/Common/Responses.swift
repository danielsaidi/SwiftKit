//
//  Responses.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public typealias ModelResponse<T> = (_ result: ModelResult<T>) -> Void

public typealias EmptyResponse = ModelResponse<Void>
