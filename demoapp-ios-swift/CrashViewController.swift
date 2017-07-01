
import UIKit

class CrashViewController: UIViewController {
    
    @IBOutlet weak var fatalErrorButton: UIButton!
    
    var pageIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fatalErrorButton.layer.cornerRadius = 10.0
        
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    @IBAction func crashButtonTapped(_ sender: UIButton) {
            print("fatalError crash activated")
//            fatalError()
            
        }
}
