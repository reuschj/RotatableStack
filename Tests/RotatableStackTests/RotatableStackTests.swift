import XCTest
@testable import RotatableStack

final class RotatableStackTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(RotatableStack().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
