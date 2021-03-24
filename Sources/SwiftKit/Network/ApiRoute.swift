//
//  ApiRoute.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-10-24.
//  Copyright © 2020 Cineasterna. All rights reserved.
//

import Foundation

/**
 This enum represents an external api route, e.g. logging in,
 fetching a logged in user's profile etc.
 
 The only requirement of an api route is that is must have a
 `path` and a `queryParams` collection.
 
 You can url encode any query param with `urlEncode`, if you
 plan on sending it with GET.
 */
public protocol ApiRoute {
    
    var path: String { get }
    var queryParams: [String: String] { get }
}

public extension ApiRoute {
    
    /**
     Convert the route's `queryItems` collection to a string
     that can be used for form data requests.
     */
    var formDataString: String {
        queryItems.map { "\($0.name)=\($0.value ?? "")" }.joined(separator: "&")
    }
    
    /**
     The route's query items, which are mapped `queryParams`.
     */
    var queryItems: [URLQueryItem] {
        queryParams
            .map { URLQueryItem(name: $0.key, value: $0.value) }
            .sorted { $0.name < $1.name }
    }
    
    /**
     This function returns a `URLRequest` that is configured
     with `application/x-www-form-urlencoded` `Content-Type`
     and the query params of the route applied as `httpBody`,
     using `POST` as `httpMethod`.
     */
    func formDataRequest(for env: ApiEnvironment) -> URLRequest {
        var req = request(for: env, httpMethod: "POST")
        req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        req.httpBody = formDataString.data(using: .utf8)
        return req
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
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    /**
     The route's url in a certain api environment.
     */
    func url(in environment: ApiEnvironment) -> URL {
        environment.url.appendingPathComponent(path)
    }
    
    /**
     Url encode a parameter value.
     
     You must call this manually for each parameter that you
     want to encode. It's not handled automatically.
     */
    func urlEncode(_ param: String) -> String {
        let encoded = param
            .addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)?
            .replacingOccurrences(of: "&", with: "%26")
        return encoded ?? param
    }
}
