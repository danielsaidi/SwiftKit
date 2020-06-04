//
//  Url+QueryParameters.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

public extension URL {
    
    var queryParameters: [URLQueryItem] {
        URLComponents(string: absoluteString)?.queryItems ?? [URLQueryItem]()
    }
    
    var queryParametersDictionary: [String: String] {
        var result = [String: String]()
        queryParameters.forEach { result[$0.name] = $0.value ?? "" }
        return result
    }
    
    
    func queryParameter(named name: String) -> URLQueryItem? {
        queryParameters.first { $0.isNamed(name) }
    }
    
    func setQueryParameter(name: String, value: String) -> URL? {
        guard let urlString = absoluteString.components(separatedBy: "?").first else { return self }
        let param = queryParameter(named: name)
        let name = param?.name ?? name
        var dictionary = queryParametersDictionary
        dictionary[name] = value
        let queryString = dictionary.urlEncoded()
        return URL(string: "\(urlString)?\(queryString)")
    }
    
    func setQueryParameters(_ dict: [String: String]) -> URL? {
        var result = self
        dict.forEach {
            result = result.setQueryParameter(name: $0, value: $1) ?? result
        }
        return result
    }
}


// MARK: - Dictionary Extensions

private extension Dictionary where Key == String, Value == String {
    
    func urlEncoded() -> String {
        let parameterArray = map { (key, value) -> String in
            guard
                let key = key.urlEncoded(),
                let value = value.urlEncoded()
                else { return "" }
            return "\(key)=\(value)"
        }
        return parameterArray.joined(separator: "&")
    }
}


// MARK: - URLQueryItem Extensions

private extension URLQueryItem {
    
    func isNamed(_ name: String) -> Bool {
        self.name.lowercased() == name.lowercased()
    }
}
