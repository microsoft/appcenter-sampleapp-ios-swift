
import UIKit

// make an enumeration of service Types
enum ServiceType {
    case Build, Test, Distribute, Crash, Analytics, Push
}

// Define a class named service

class service {

    // set variables associated with service
    var name: String
    var type: ServiceType

    // Initilization function for the class
    init(name: String, type: ServiceType) {
        // create instances
        self.name = name
        self.type = type
    }

    // switch statement that changes the imageViews depending on serviceType
    func serviceImage() -> UIImage? {
        switch type {
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

    func serviceBlurb() -> String? {
        switch type {
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
