
import UIKit
import AppCenterAnalytics

class AnalyticsViewController: UIViewController {

    @IBOutlet weak var customEventButton: UIButton!
    @IBOutlet weak var customColorButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customColorButton.layer.cornerRadius = 10.0
        customEventButton.layer.cornerRadius = 10.0

        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = false
    }

    @IBAction func analyticsButtonTapped(_ sender: UIButton) {
        switch sender {
        case customEventButton:
            Analytics.trackEvent("Sample event")
            print("send a custom event")
            presentCustomEventAlert()

        case customColorButton:
            print("send a custom event with color property")
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
                                      handler: { _ in alert.dismiss(animated: true)
        }))
        present(alert, animated: true)
    }

    func presentColorPropertyAlert() {
        let alert = UIAlertController(title: "Choose a color",
                                      message: "",
                                      preferredStyle: .alert)
        alert.view.tintColor = UIColor.black

        // Yellow button
        alert.addAction(UIAlertAction(title: "💛 Yellow",
                                      style: .default,
                                      handler: { _ in alert.dismiss(animated: true)
                                          Analytics.trackEvent("Color event", withProperties: ["Color": "Yellow"])
        }))

        // Blue button
        alert.addAction(UIAlertAction(title: "💙 Blue",
                                      style: .default,
                                      handler: { _ in alert.dismiss(animated: true)
                                          Analytics.trackEvent("Color event", withProperties: ["Color": "Blue"])
        }))

        // Red button
        alert.addAction(UIAlertAction(title: "❤️ Red",
                                      style: .default,
                                      handler: { _ in alert.dismiss(animated: true)
                                          Analytics.trackEvent("Color event", withProperties: ["Color": "Red"])
        }))

        present(alert, animated: true)
    }
}
