import Foundation

/// [DEPRECATED] Use ApiKit instead
public protocol ApiModel: Decodable {
    
    associatedtype LocalModel
    
    func convert() -> LocalModel
}
