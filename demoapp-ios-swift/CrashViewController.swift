
import UIKit

class CrashViewController: UIViewController {

    @IBOutlet weak var fatalErrorButton: UIButton!

    var pageIndex: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fatalErrorButton.layer.cornerRadius = 10.0

        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = false
    }

    @IBAction func crashButtonTapped(_: UIButton) {
        print("fatalError crash activated")
        fatalError()
    }
}
