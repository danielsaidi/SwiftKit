import Foundation

/**
 This enum lists the various HTTP methods that are supported
 by REST.
 */
public enum HttpMethod: String {
    
    case get
    case put
    case post
    case delete
    case head
    case options
    case trace
    case connect
    
    public var method: String { rawValue.uppercased() }
}
