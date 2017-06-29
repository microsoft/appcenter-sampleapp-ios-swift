
import UIKit

class CrashViewController: UIViewController {
    
    @IBOutlet weak var fatalErrorButton: UIButton!
    //@IBOutlet weak var nilValueButton: UIButton!
    @IBOutlet weak var crashNavigationItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fatalErrorButton.layer.cornerRadius = 10.0
        
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    @IBAction func crashButtonTapped(_ sender: UIButton) {
//        switch sender {
//        case fatalErrorButton:
            print("fatalError crash activated")
//            fatalError()
//
//        case nilValueButton:
//            print("Found nil in optional value crash activated")
//            let n: Int? = nil
//            let val = n!
//            
//        default:
//            break
            
        }

//    @IBAction func crashButtonTapped(_ sender: UIButton) {
//        switch sender {
//        case fatalErrorButton:
//            print("fatalError crash activated")
//            fatalError()
//
//        case nilValueButton:
//            print("Found nil in optional value crash activated")
//            let n: Int? = nil
//            let val = n!
//
//        default:
//            break
//        }
//    }
}
