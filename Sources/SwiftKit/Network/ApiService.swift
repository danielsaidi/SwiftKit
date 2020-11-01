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
    
    func request(for route: ApiRoute, httpMethod: String = "GET") -> URLRequest {
        let url = route.url(in: environment)
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { fatalError("Could not create URLComponents for \(url.absoluteString)") }
        components.queryItems = route.queryItems
        guard let requestUrl = components.url else { fatalError("Could not create URLRequest for \(url.absoluteString)") }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = httpMethod
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func task<Model: ApiModel>(for request: URLRequest, type: Model.Type, completion: @escaping ApiCompletion<Model.LocalModel>) -> URLSessionDataTask {
        session.dataTask(with: request) { data, response, error in
            if let error = error { return completion(.failure(error)) }
            guard let response = response as? HTTPURLResponse else { return completion(.failure(ApiServiceError.invalidResponse)) }
            let status = response.statusCode
            DispatchQueue.main.async {
                guard status == 200 else { return completion(.failure(ApiServiceError.statusCode(status))) }
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
    
    func performTask<Model: ApiModel>(with request: URLRequest, type: Model.Type, completion: @escaping ApiCompletion<Model.LocalModel>) {
        task(for: request, type: type, completion: completion).resume()
    }
}
