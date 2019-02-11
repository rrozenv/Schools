import XCTest
@testable import Prelude

class UIButtonTests: XCTestCase {
  func testSetBackgroundColor() {
    let button = UIButton()
    button.setBackgroundColor(.white, for: [])
    XCTAssertNotNil(button.backgroundImage(for: .normal))
  }
}
