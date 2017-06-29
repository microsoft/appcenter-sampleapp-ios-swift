
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var serviceBlurb: UITextView!
    @IBOutlet weak var serviceTitleLabel: UILabel!
    @IBOutlet weak var serviceImageView: UIImageView!

    func configureView() {
        _ = view
        // Update the user interface for the detail item.
        if service != nil {
            if let label = serviceTitleLabel {
                label.text = service?.name
                serviceImageView.image = service?.serviceImage()
                serviceBlurb.text = service?.serviceBlurb()
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

    var service: service? {
        didSet {
            // Update the view.
            configureView()
        }
    }
}
