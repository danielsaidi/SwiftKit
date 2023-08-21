import Foundation

@available(*, deprecated, message: "This is no longer used. Use LAContext directly instead.")
public protocol AuthenticationService: AnyObject {
    
    typealias AuthCompletion = (_ result: AuthResult) -> Void
    typealias AuthError = AuthenticationServiceError
    typealias AuthResult = Result<Void, Error>
    
    func authenticateUser(
        for auth: Authentication,
        reason: String,
        completion: @escaping AuthCompletion)
    
    func canAuthenticateUser(
        for auth: Authentication
    ) -> Bool
}
