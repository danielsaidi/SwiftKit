import Foundation

@available(*, deprecated, message: "This is no longer used. Use LAContext directly instead.")
public class CachedAuthenticationServiceProxy: CachedAuthenticationService {
        
    public init(baseService: AuthenticationService) {
        self.baseService = baseService
    }
    
    private let baseService: AuthenticationService
    private var cache = [String: Bool]()
    
    public func authenticateUser(for auth: Authentication, reason: String, completion: @escaping AuthCompletion) {
        if isUserAuthenticated(for: auth) { return completion(.success(())) }
        baseService.authenticateUser(for: auth, reason: reason) { result in
            self.handle(result, for: auth)
            completion(result)
        }
    }
    
    public func canAuthenticateUser(for auth: Authentication) -> Bool {
        baseService.canAuthenticateUser(for: auth)
    }
    
    public func isUserAuthenticated(for auth: Authentication) -> Bool {
        cache[auth.id] ?? false
    }
    
    public func resetUserAuthentication(for auth: Authentication) {
        setIsAuthenticated(false, for: auth)
    }
    
    public func resetUserAuthentications() {
        cache.removeAll()
    }
}

@available(*, deprecated, message: "This is no longer used. Use LAContext directly instead.")
private extension CachedAuthenticationServiceProxy {
    
    func handle(_ result: AuthResult, for auth: Authentication) {
        switch result {
        case .failure: setIsAuthenticated(false, for: auth)
        case .success: setIsAuthenticated(true, for: auth)
        }
    }
    
    func setIsAuthenticated(_ isAuthenticated: Bool, for auth: Authentication) {
        cache[auth.id] = isAuthenticated
    }
}
