//
//  demoapp_ios_swiftTests.swift
//  demoapp-ios-swiftTests
//
//  Created by Tina on 2017-06-19.
//  Copyright © 2017 Tina. All rights reserved.
//

import XCTest
@testable import demoapp_ios_swift

class demoapp_ios_swiftTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testAnalyticsTap() {
        // isolate each class, control inputs, assert outputs
        // make sure that when the buttons are tapped, the correct text pops up.
        let model = XCUIApplication()
        model.buttons["customEventButton"].tap()
       let labelValue = model.staticTexts["controlLabel"]
       // XCTAssert(true) is the basis of the test
        XCTAssert(labelValue.label == "sample event button pressed")
    }

    // assert that pageview is on the screen
    func assertPageView() {
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
