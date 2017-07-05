
  import UIKit
  
class RootViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    // give a list of service
    var services: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Here, we manually add our services to the Data Model
        services = ["welcomeViewController",
                    "buildViewController",
                    "testViewController",
                    "distributeViewController",
                    "crashViewController",
                    "analyticsViewController",
                    "pushViewController"]
        
        self.delegate = self
        self.dataSource = self
        
        // set the starting viewController, in this case it is welcomeViewController
        let startingViewController = self.storyboard?.instantiateViewController(withIdentifier: "welcomeViewController")
        setViewControllers([startingViewController!],
            direction: .forward,
            animated: true,
            completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
           }

    //MARK: - UIPageViewController protocol functions
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let identifier = viewController.restorationIdentifier {
            if let index = services.index(of: identifier) {
                if index > 0 {
                    return self.storyboard?.instantiateViewController(withIdentifier: services[index-1])
                }
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let identifier = viewController.restorationIdentifier {
            if let index = services.index(of: identifier) {
                if index < services.count - 1 {
                    return self.storyboard?.instantiateViewController(withIdentifier: services[index+1])
                }
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return services.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
