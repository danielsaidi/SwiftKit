//
//  Url+QueryParameters.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "Use ApiKit instead")
public extension URL {
    
    /// Get the url's query parameters.
    var queryParameters: [URLQueryItem] {
        URLComponents(string: absoluteString)?.queryItems ?? [URLQueryItem]()
    }
    
    /// Get the url's query parameters as a dictionary.
    var queryParametersDictionary: [String: String] {
        var result = [String: String]()
        queryParameters.forEach { result[$0.name] = $0.value ?? "" }
        return result
    }
    
    /// Get a certain query parameter by name.
    func queryParameter(named name: String) -> URLQueryItem? {
        queryParameters.first { $0.isNamed(name) }
    }
    
    /**
     Set the value of a certain query parameter.
     
     This will return a new url where the query parameter is
     either updated or added.
     */
    func setQueryParameter(name: String, value: String, urlEncode: Bool = true) -> URL? {
        guard let urlString = absoluteString.components(separatedBy: "?").first else { return self }
        let param = queryParameter(named: name)
        let name = param?.name ?? name
        var dictionary = queryParametersDictionary
        dictionary[name] = urlEncode ? value.urlEncoded() : value
        return URL(string: "\(urlString)?\(dictionary.queryString)")
    }
    
    /**
     Set the value of a certain set of query parameters.
     
     This will return a new url, where every query parameter
     in the dictionary is either updated or added.
     */
    func setQueryParameters(_ dict: [String: String], urlEncode: Bool = true) -> URL? {
        var result = self
        dict.forEach {
            result = result.setQueryParameter(name: $0, value: $1) ?? result
        }
        return result
    }
}


// MARK: - Dictionary Extensions

private extension Dictionary where Key == String, Value == String {
    
    var queryString: String {
        let parameters = map { "\($0)=\($1)" }
        return parameters.joined(separator: "&")
    }
}


// MARK: - URLQueryItem Extensions

private extension URLQueryItem {
    
    func isNamed(_ name: String) -> Bool {
        self.name.lowercased() == name.lowercased()
    }
}
