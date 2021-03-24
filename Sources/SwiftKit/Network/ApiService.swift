//
//  ApiService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-09-30.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by any service that can be
 used to communicate with an external api.
 */
public protocol ApiService: AnyObject {
    
    var environment: ApiEnvironment { get }
    var session: URLSession { get }
    
    typealias ApiCompletion<T> = (ApiResult<T>) -> Void
    typealias ApiResult<T> = Result<T, Error>
}

public extension ApiService {
    
    /**
     This function returns a `URLRequest` that is configured
     with `application/x-www-form-urlencoded` `Content-Type`
     and the query params of the route applied as `httpBody`,
     using `POST` as `httpMethod`.
     */
    func formDataRequest(for route: ApiRoute) -> URLRequest {
        route.formDataRequest(for: environment)
    }
    
    /**
     This function returns a `URLRequest` that is configured
     for the given `httpMethod` and the route's `queryItems`.
     */
    func request(for route: ApiRoute, httpMethod: String = "GET") -> URLRequest {
        route.request(for: environment, httpMethod: httpMethod)
    }
    
    /**
     Get a data task for a certain `request`, which will try
     to deserialize any success data to the provided `type`.
     */
    func task<Model: ApiModel>(for request: URLRequest, type: Model.Type, completion: @escaping ApiCompletion<Model.LocalModel>) -> URLSessionDataTask {
        session.dataTask(with: request) { data, response, error in
            if let error = error { return completion(.failure(error)) }
            guard let response = response as? HTTPURLResponse else { return completion(.failure(ApiServiceError.invalidResponse)) }
            let status = response.statusCode
            DispatchQueue.main.async {
                guard status >= 200, status < 300 else { return completion(.failure(ApiServiceError.statusCode(status))) }
                guard let data = data else { return completion(.failure(ApiServiceError.missingData)) }
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(Model.self, from: data)
                    completion(.success(result.convert()))
                } catch {
                    completion(.failure(ApiServiceError.invalidData(data, error)))
                }
            }
        }
    }
    
    /**
     Perform a data task for a certain `request` then try to
     deserialize any success data to the provided `type`.
     */
    func performTask<Model: ApiModel>(with request: URLRequest, type: Model.Type, completion: @escaping ApiCompletion<Model.LocalModel>) {
        task(for: request, type: type, completion: completion).resume()
    }
}
