//
//  ApiRoute.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-10-24.
//  Copyright © 2020 Cineasterna. All rights reserved.
//

import Foundation

/**
 This enum represents an external api route, e.g. fetching a
 logged in user's profile.
 
 The only requirement of an api route is that is must have a
 `path` and a `queryParams` collection. You can url encode a
 query param value with the `urlEncode` function. When using
 an `ApiRoute` with an `ApiService`, the service will expect
 any params to already be encoded.
 
 `TODO` Unit test this logic.
 */
public protocol ApiRoute {
    
    var path: String { get }
    var queryParams: [String: String] { get }
}

public extension ApiRoute {
    
    var queryItems: [URLQueryItem] {
        queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
    
    func url(in environment: ApiEnvironment) -> URL {
        environment.url.appendingPathComponent(path)
    }
    
    func urlEncode(_ param: String) -> String {
        let encoded = param
            .addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)?
            .replacingOccurrences(of: "&", with: "%26")
        return encoded ?? param
    }
}
