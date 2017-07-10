//
//  OnboardingViewController.swift
//  demoapp-ios-swift
//
//  Created by Sherin Shibu on 7/10/17.
//  Copyright © 2017 Tina. All rights reserved.
//

import UIKit
// this class helps verify the state expected by the line XCTAssertTrue(app.isDisplayingOnboarding) 

final class OnboardingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "onboardingView"
    }
}
