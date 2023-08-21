import Foundation

@available(*, deprecated, message: "This is no longer used. Use LAContext directly instead.")
public struct Authentication: Identifiable, Equatable {

    public init(id: String) {
        self.id = id
    }

    public var id: String

    static var standard: Authentication {
        Authentication(id: "com.swiftkit.auth.any")
    }
}
