import Foundation

/// [DEPRECATED] Use ApiKit instead
public protocol ApiService: AnyObject {
    
    var environment: ApiEnvironment { get }
    var session: URLSession { get }
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
    func request(
        for route: ApiRoute,
        httpMethod: HttpMethod = .get
    ) -> URLRequest {
        route.request(for: environment, httpMethod: httpMethod)
    }
    
    func task<Model: ApiModel>(
        for route: ApiRoute,
        type: Model.Type,
        httpMethod: HttpMethod = .get,
        completion: @escaping ApiCompletion<Model.LocalModel>
    ) -> URLSessionDataTask {
        let request = self.request(for: route, httpMethod: httpMethod)
        return task(for: request, type: type, completion: completion)
    }
    
    /**
     Get a data task for a certain `request`, which will try
     to deserialize any success data to the provided `type`.
     */
    func task<Model: ApiModel>(
        for request: URLRequest,
        type: Model.Type,
        completion: @escaping ApiCompletion<Model.LocalModel>) -> URLSessionDataTask {
        session.dataTask(with: request) { data, response, error in
            let httpResponse = response as? HTTPURLResponse
            let apiError = ApiError.invalidResponse(data, httpResponse, error)
            let failure = ApiResult<Model.LocalModel>.failure(apiError)
            guard error == nil, let response = httpResponse else {
                return self.completeOnMain { completion(failure) }
            }
            let statusCode = response.statusCode
            guard statusCode >= 200, statusCode < 300 else {
                return self.completeOnMain { completion(failure) }
            }
            guard let data = data else { return completion(failure) }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Model.self, from: data)
                self.completeOnMain {
                    completion(.success(result.convert()))
                }
            } catch {
                self.completeOnMain {
                    completion(.failure(ApiError.invalidData(data, response, error)))
                }
            }
        }
    }
    
    /**
     Perform a data task for a certain `request` then try to
     deserialize any success data to the provided `type`.
     */
    func performTask<Model: ApiModel>(
        for route: ApiRoute,
        type: Model.Type,
        httpMethod: HttpMethod = .get,
        completion: @escaping ApiCompletion<Model.LocalModel>) {
        task(for: route, type: type, httpMethod: httpMethod, completion: completion).resume()
    }
    
    /**
     Perform a data task for a certain `request` then try to
     deserialize any success data to the provided `type`.
     */
    func performTask<Model: ApiModel>(
        with request: URLRequest,
        type: Model.Type,
        completion: @escaping ApiCompletion<Model.LocalModel>) {
        task(for: request, type: type, completion: completion).resume()
    }
}

private extension ApiService {
    
    func completeOnMain(_ completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            completion()
        }
    }
}
