import XCTest
@testable import SwiftKit

final class SwiftKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
