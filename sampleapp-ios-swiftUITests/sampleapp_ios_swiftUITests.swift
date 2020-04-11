
import XCTest

class sampleapp_ios_swiftUITests: XCTestCase {
    let app = XCUIApplication()


    func testSnapshot() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        snapshot("StartScreen")
    }

    func testSwipeUntilCrashesPage() {
        // Assert that the crash button exists
        let window = app.windows.element(boundBy: 0)
        let fatalErrorButtonQuery = app.buttons.matching(identifier: "fatalErrorButton")
        XCTAssert(window.frame.contains(fatalErrorButtonQuery.accessibilityFrame))
    }
}
