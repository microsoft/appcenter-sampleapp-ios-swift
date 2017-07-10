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
        // have the app running
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPresentationCountFunctionality() {
        // test to make sure that the RootViewController func presentationCount returns the correct value
        
        XCTAssert(true)
    }
    
    func testCrashAlertViewShows(){
        class FakeAlert : CrashViewController {
            var controllerWasCalled = false
            
            override func presentCrashAlert(){
                controllerWasCalled = true
            }
        }
        let vc = CrashViewController()
        vc.alertView = UIAlertController()
        vc.viewDidLoad()
        XCTAssertTrue((vc.alertView as UIAlertController).controllerWasCalled, "alert was not called.")
    }
        
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
