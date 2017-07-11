
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
        // method called before invocation of each test method in class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCrashViewControllerLoads() {
        // test to ensure that the crash view controller loads.
        let vc = CrashViewController()
        XCTAssertNotNil(vc.view, "View did not load for CrashViewController.")
    }
}
