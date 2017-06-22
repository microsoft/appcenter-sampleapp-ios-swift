//
//  AnalyticsViewController.swift
//  demoapp-ios-swift
//
//  Created by Tina on 2017-06-22.
//  Copyright © 2017 Tina. All rights reserved.
//

import UIKit

class AnalyticsViewController: UIViewController {
    
    @IBOutlet weak var beaconTitleLabel: UILabel!
    
    func configureView() {
        // Update the user interface for the detail item.
        if beacon != nil {
            if let label = beaconTitleLabel {
                label.text = beacon?.name
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var beacon: Beacon? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    
}


