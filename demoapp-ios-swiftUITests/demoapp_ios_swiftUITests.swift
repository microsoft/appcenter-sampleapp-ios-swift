//
//  demoapp_ios_swiftUITests.swift
//  demoapp-ios-swiftUITests
//
//  Created by Tina on 2017-06-07.
//  Copyright © 2017 Tina. All rights reserved.
//

import XCTest

class demoapp_ios_swiftUITests: XCTestCase {

    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testLButton() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let app = XCUIApplication()
        app.buttons["L"].tap()
        let labelData = app.staticTexts["controlLabel"]
        XCTAssertNotNil(labelData)
        XCTAssert(labelData.label == "To the left.")
    }

    func testRButton() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let app = XCUIApplication()
        app.buttons["R"].tap()
        let labelData = app.staticTexts["controlLabel"]
        XCTAssert(labelData.label == "In the right.")
    }
}
