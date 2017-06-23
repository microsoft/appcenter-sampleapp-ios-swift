//
//  CrashViewController.swift
//  demoapp-ios-swift
//
//  Created by Tina on 2017-06-22.
//  Copyright © 2017 Tina. All rights reserved.
//

import UIKit

class CrashViewController: UIViewController {
    
    @IBOutlet weak var fatalErrorButton: UIButton!
    @IBOutlet weak var nilValueButton: UIButton!
    
    
    @IBAction func crashButtonTapped(_ sender: UIButton) {
        switch sender {
        case fatalErrorButton:
            print("fatalError crash activated")
            fatalError()
            
        case nilValueButton:
            print("Found nil in optional value crash activated")
            let n: Int? = nil
            let val = n!
            
        default:
            break
        }
    }
}
