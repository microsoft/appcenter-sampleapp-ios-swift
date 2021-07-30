
import UIKit
import AppCenter
import AppCenterCrashes

class CrashViewController: UIViewController {
    
    @IBOutlet weak var setUserIdButton: UIButton!
    
    @IBOutlet weak var fatalErrorButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fatalErrorButton.layer.cornerRadius = 10.0

        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = false
    }

    @IBAction func userIdButtonTapped(_: UIButton) {
        // Set a user id
        AppCenter.userId = "<CUSTOM USER ID HERE"
        print("set a user id")
        presentCustomUserIdAlert()
    }
    
    @IBAction func crashButtonTapped(_: UIButton) {
        presentCrashAlert()
    }

    // - MARK: Alert Functions
    
    func presentCustomUserIdAlert() {
        let alert = UIAlertController(title: "User ID sent",
                                      message: "",
                                      preferredStyle: .alert)
        
        // OK Button
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { _ in alert.dismiss(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func presentCrashAlert() {
        let alert = UIAlertController(title: "The app will close",
                                      message: "A crash report will be sent when you reopen the app.",
                                      preferredStyle: UIAlertController.Style.alert)

        // Cancel Button
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: UIAlertAction.Style.default,
                                      handler: { _ in alert.dismiss(animated: true)
        }))
        // Crash App button
        alert.addAction(UIAlertAction(title: "Crash app",
                                      style: UIAlertAction.Style.destructive,
                                      handler: { _ in alert.dismiss(animated: true)
                                          // generate test crash
                                          Crashes.generateTestCrash()
                                          fatalError()
        }))

        present(alert, animated: true)
    }
}
