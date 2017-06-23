//
//  Beacon.swift
//  demoapp-ios-swift
//
//  Created by Tina on 2017-06-19.
//  Copyright © 2017 Tina. All rights reserved.
//

import UIKit

// make an enumeration of Beacon Types
enum BeaconType {
    case Build, Test, Distribute, Crash, Analytics, Push
}

// Define a class named Beacon

class Beacon {
    
    // set variables associated with Beacon
    var name: String
    var type: BeaconType
    
    // Initilization function for the class
    init(name: String, type: BeaconType) {
        // create instances
        self.name = name
        self.type = type
    }
    
    // switch statement that changes the imageViews depending on BeaconType
    func beaconImage() -> UIImage? {
        switch self.type {
        case .Build:
            return UIImage(named: "build")
        case .Test:
            return UIImage(named: "test")
        case .Distribute:
            return UIImage(named: "distribute")
        case .Push:
            return UIImage(named: "push")
        
        default:
            return UIImage(named: "crash")
        }
    }
    
    func beaconBlurb() -> String? {
        switch self.type {
        case .Build:
            return "Mobile Center can securely build your team's app - simply sign in with Github, Bitbucket, or Visual Studio Team Services and never worry about your local build server again."
        case .Test:
            return "This is Test"
        case .Distribute:
            return "This is Distribute"
        case .Push:
            return "This is Push"
            
        default:
            return "Sorry, an error has occured"
        }
    }
}

