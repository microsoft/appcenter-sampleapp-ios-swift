//
//  ViewController.swift
//  demoapp-ios-swift
//
//  Created by Tina on 2017-06-07.
//  Copyright © 2017 Tina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var controlLabel: UILabel!
    @IBOutlet weak var crash1Button: UIButton!
    @IBOutlet weak var crash2Button: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func leftButtonClick(_ sender: UIButton) {
        // display the following text within the label when the left button is pressed.
        controlLabel.text = "To the left."
    }
    
    @IBAction func rightButtonClick(_ sender: UIButton) {
        // display the following text within the label when right button is pressed.
        controlLabel.text = "In the right."
    }
    
    @IBAction func activateCrash(_ sender: UIButton) {
        switch sender {
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
