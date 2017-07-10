//
//  demoapp_ios_swiftUITests.swift
//  demoapp-ios-swiftUITests
//
//  Created by Tina on 2017-06-19.
//  Copyright © 2017 Tina. All rights reserved.
//

import XCTest

class demoapp_ios_swiftUITests: XCTestCase {
    var app:XCUIApplication

    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        // enable app to reset state.
        app.launchArguments.append("--uitesting")
    }
    
    func testGoingUntilPressingCrashButton() {
        app.launch()
        
        // Make sure the app displays the first page to swipe from.
        XCTAssertTrue(app.isDisplayingUntilCrash)
        
        // Swipe towards the left four times to get to crashes
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        
        // Onboarding should no longer be displayed
        XCTAssertFalse(app.isDisplayingUntilCrash)
     }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
