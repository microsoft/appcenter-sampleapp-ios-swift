
import UIKit

class ServiceViewController: UIViewController {
    
    @IBOutlet weak var serviceText: UITextView!
    @IBOutlet weak var serviceBackground: UIView!
    @IBOutlet weak var serviceImageView: UIImageView!
    
    var pageIndex: Int!
    
    func configureView() {
        // Update the user interface for the detail item.
        if service != nil {
            if let blurb = serviceText {
                blurb.text = service?.getserviceBlurb()
                serviceImageView.image = service?.getserviceImage()
                serviceBackground.backgroundColor = service?.getserviceColor()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var service: Service? {
        didSet {
            // Update the view.
            configureView()
        }
    }
}
