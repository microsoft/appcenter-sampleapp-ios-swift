
import UIKit

class AnalyticsViewController: UIViewController {

    @IBOutlet weak var customEventButton: UIButton!
    @IBOutlet weak var customColorButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customColorButton.layer.cornerRadius = 10.0
        customEventButton.layer.cornerRadius = 10.0

        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = false
    }

    @IBAction func analyticsButtonTapped(_ sender: UIButton) {
        switch sender {
        case customEventButton:
            MSAnalytics.trackEvent("sample event")
            print("TODO: send a custom alert via Cocoapods")
            presentCustomEventAlert()
            
        case customColorButton:
            print("custom color property button pressed")
            presentColorPropertyAlert()

        default:
            break
        }
    }
    
    // - MARK: Alert Functions
    
    func presentCustomEventAlert() {
        let alert = UIAlertController(title: "Event sent",
                                      message: "",
                                      preferredStyle: .alert)
        
        // OK Button
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { (action) in alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated:true, completion: nil)
    }
    
    func presentColorPropertyAlert() {
        let alert = UIAlertController(title: "Choose a color",
                                      message: "",
                                      preferredStyle: .alert)
        alert.view.tintColor = UIColor.black
        
        // Yellow button
        alert.addAction(UIAlertAction(title: "Yellow",
                                      style: .default,
                                      handler: { (action) in alert.dismiss(animated: true, completion: nil)
        }))
        // sent yellow event here
        MSAnalytics.trackEvent("color event", withProperties: ["yellow"])

        // Blue button
        alert.addAction(UIAlertAction(title: "Blue",
                                      style: .default,
                                      handler: { (action) in alert.dismiss(animated: true, completion: nil)
        }))
        //sent blue event here
         MSAnalytics.trackEvent("color event", withProperties: ["blue"])
        
        // Red button
        alert.addAction(UIAlertAction(title: "Red",
                                      style: .default,
                                      handler: { (action) in alert.dismiss(animated: true, completion: nil)
        }))
        //sent red event here
        MSAnalytics.trackEvent("color event", withProperties: ["red"])
        
        self.present(alert, animated:true, completion: nil)
    }
}
