import Foundation

/// [DEPRECATED] Use ApiKit instead
public enum HttpMethod: String {
    
    case connect
    case delete
    case get
    case head
    case options
    case post
    case put
    case trace
    
    public var method: String { rawValue.uppercased() }
}
