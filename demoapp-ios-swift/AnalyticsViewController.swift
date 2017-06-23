//
//  AnalyticsViewController.swift
//  demoapp-ios-swift
//
//  Created by Tina on 2017-06-22.
//  Copyright © 2017 Tina. All rights reserved.
//

import UIKit

class AnalyticsViewController: UIViewController {
    
    @IBOutlet weak var controlLabel: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    
    
    @IBAction func analyticsButtonTapped(_ sender: UIButton) {
        switch sender {
        case topButton:
            controlLabel.text = "Up top!"
        case bottomButton:
            controlLabel.text = "Down low."
            
        default:
            break
        }
    }
    
}
