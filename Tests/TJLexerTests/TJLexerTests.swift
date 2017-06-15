import XCTest
@testable import TJLexer

class TJLexerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(TJLexer().text, "Hello, World!")
    }


    static var allTests: [(String, (TJLexerTests) -> () -> Void)] = [
        ("testExample", testExample),
    ]
}
