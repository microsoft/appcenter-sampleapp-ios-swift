//
//  ViewController.swift
//  demoapp-ios-swift
//
//  Created by Tina on 2017-06-07.
//  Copyright © 2017 Tina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var crash1Button: UIButton!
    @IBOutlet weak var crash2Button: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func activateCrash(_sender: UIButton) {
        switch _sender {
        case crash1Button:
            print ("crash 1 activated, should be Fatal Error")
            fatalError()
            
        case crash2Button:
            print ("crash 2 activated, should be found nil in optional value")
            let n: Int? = nil
            let val = n!
            
        default:
            break
        }
    }

}

