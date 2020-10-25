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
 path and params, that together with an `ApiEnvironment` can
 be used to create a complete url to the route.
 
 The difference between routes and endpoints, is that routes
 are addresses to one or multiple endpoints. A route to e.g.
 `xxx/blog/123` can have endpoints for `GET`, `POST` etc.
 
 SwiftKit currently only uses `ApiEnvironment` and `ApiRoute`.
 */
public protocol ApiRoute {
    
    var path: String { get }
    var params: [String: String] { get }
}

public extension ApiRoute {
    
    func url(in environment: ApiEnvironment) -> URL {
        environment.url.appendingPathComponent(path)
    }
}
