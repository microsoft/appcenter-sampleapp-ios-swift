
import UIKit

// make an enumeration of service Types
enum ServiceType {
    case Build, Test, Distribute, Crash, Analytics, Push
}

// Define a class named service

class Service {
    
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
    func getserviceImage() -> UIImage? {
        switch type {
        case .Build:
            return UIImage(named: "Build")
        case .Test:
            return UIImage(named: "Test")
        case .Distribute:
            return UIImage(named: "Distribute")
        case .Push:
            return UIImage(named: "Push")
            
        default:
            return UIImage(named: "Crashes")
        }
    }
    
    func getserviceBlurb() -> String? {
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
    
    func getserviceColor() -> UIColor {
        switch type {
        case .Build:
            return UIColor(hex: "0078D7")
        case .Test:
            return UIColor(hex: "1FAECE")
        case .Distribute:
            return UIColor(hex: "44B8A8")
        case .Push:
            return UIColor(hex: "F56D4F")
            
        default:
            return UIColor(hex: "000000")
        }
    }
}

// helper function to get UIColor from given hex number
extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
