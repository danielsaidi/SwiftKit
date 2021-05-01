//
//  ApiRoute.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-10-24.
//  Copyright © 2020 Cineasterna. All rights reserved.
//

import Foundation

/**
 This protocol represents an external api route, e.g. `login`
 or `user`. Each route is a separate action that defines all
 information required to perform an api request.
 
 `IMPORTANT` Since the `postParams` and `queryParams` values
 are url encoded by `postParamsString` and `queryItems`, the
 resulting network call must not do this automatically. Just
 send them as is.
 */
public protocol ApiRoute {
    
    /**
     The route's environment-relative path, that is appended
     to the environment's url when performing a request.
     */
    var path: String { get }
    
    /**
     The route's optional post data, that should be added as
     `httpBody` when performing a request. When defined, the
     property takes precedence over `postParams`.
     */
    var postData: Data? { get }
    
    /**
     The route's optional post data dictionary, which should
     be added as a .utf8 encoded `httpBody` data string when
     performing a request.
     */
    var postParams: [String: String] { get }
    
    /**
     The route's optional query data dictionary, that should
     be added as a .utf8 encoded `httpBody` data string when
     performing a request.
     */
    var queryParams: [String: String] { get }
}

public extension ApiRoute {
    
    /**
     Convert the route `formDataParams` to `.utf8` data that
     can be used in form data requests.
     */
    var postParamsData: Data? {
        postParamsString?.data(using: .utf8)
    }
    
    /**
     Convert the route `formDataParams` to a string that can
     be used in form data requests.
     */
    var postParamsString: String? {
        var params = URLComponents()
        params.queryItems = postParams
            .map { URLQueryItem(name: $0.key, value: $0.value.urlEncoded()) }
            .sorted { $0.name < $1.name }
        return params.query
    }
    
    /**
     The route's query items, which are mapped `queryParams`.
     */
    var queryItems: [URLQueryItem] {
        queryParams
            .map { URLQueryItem(name: $0.key, value: $0.value.urlEncoded()) }
            .sorted { $0.name < $1.name }
    }
    
    /**
     Create a `URLRequest` that is configured for being used
     with `application/x-www-form-urlencoded` `Content-Type`.
     */
    func formDataRequest(for env: ApiEnvironment) -> URLRequest {
        var req = request(for: env, httpMethod: .post)
        req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        req.httpBody = postParamsData
        return req
    }
    
    /**
     This function returns a `URLRequest` that is configured
     for the given `httpMethod` and the route's `queryItems`.
     */
    func request(for env: ApiEnvironment, httpMethod: HttpMethod) -> URLRequest {
        request(for: env, httpMethod: httpMethod.method)
    }
    
    /**
     This function returns a `URLRequest` that is configured
     for the given `httpMethod` and the route's `queryItems`.
     */
    func request(for env: ApiEnvironment, httpMethod: String = "GET") -> URLRequest {
        let url = self.url(in: env)
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { fatalError("Could not create URLComponents for \(url.absoluteString)") }
        components.queryItems = queryItems
        guard let requestUrl = components.url else { fatalError("Could not create URLRequest for \(url.absoluteString)") }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = httpMethod
        request.httpBody = postData ?? postParamsData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    /**
     The route's url in a certain api environment.
     */
    func url(in environment: ApiEnvironment) -> URL {
        environment.url.appendingPathComponent(path)
    }
}
