import Foundation

@available(*, deprecated, message: "This is no longer used. Use LAContext directly instead.")
public protocol CachedAuthenticationService: AuthenticationService {
    
    func isUserAuthenticated(for auth: Authentication) -> Bool
    func resetUserAuthentication(for auth: Authentication)
    func resetUserAuthentications()
}
