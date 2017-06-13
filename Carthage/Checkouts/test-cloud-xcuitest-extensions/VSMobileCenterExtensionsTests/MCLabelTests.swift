
import XCTest
import VSMobileCenterExtensions

class MCLabelTests: XCTestCase {
    func testLabel() {
        MCLabel.labelStep("Test label")
        MCLabel.labelStep("Test label with %@", args: getVaList(["args"]))
    }
}
