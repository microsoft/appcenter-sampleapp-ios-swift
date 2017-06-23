//
//  DetailViewController.swift
//  demoapp-ios-swift
//
//  Created by Tina on 2017-06-19.
//  Copyright © 2017 Tina. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var beaconBlurb: UILabel!
    @IBOutlet weak var beaconTitleLabel: UILabel!
    @IBOutlet weak var beaconImageView: UIImageView!
    
    func configureView() {
        // Update the user interface for the detail item.
        if self.beacon != nil {
            if let label = beaconTitleLabel {
                label.text = beacon?.name
                beaconImageView.image = beacon?.beaconImage()
                beaconBlurb.text = beacon?.beaconBlurb()
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

extension DetailViewController: detailViewControllerDelegate {
    func beaconSelected(newBeacon: Beacon) {
        beacon = newBeacon
    }
}

