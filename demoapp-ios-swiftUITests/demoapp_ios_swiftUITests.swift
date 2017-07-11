//
//  demoapp_ios_swiftUITests.swift
//  demoapp-ios-swiftUITests
//
//  Created by Sherin Shibu on 7/10/17.
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

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTrue() {
       XCTAssert(true)
    }
    
}
