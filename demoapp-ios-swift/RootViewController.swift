
  import UIKit
  
  class RootViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController?
    var services: [Service] = []

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Here, we manually add our services to the Data Model
        services.append(Service(name: "Build", type: ServiceType.Build))
        services.append(Service(name: "Test", type: ServiceType.Test))
        services.append(Service(name: "Distribute", type: ServiceType.Distribute))
        services.append(Service(name: "Crash", type: ServiceType.Crash))
        services.append(Service(name: "Analytics", type: ServiceType.Analytics))
        services.append(Service(name: "Push", type: ServiceType.Push))
        
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "rootViewController") as? UIPageViewController
        
        self.pageViewController?.dataSource = self

        let startingViewController: UIViewController = self.viewControllerAtIndex(0, storyboard: self.storyboard!)
        let viewControllers = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
        
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // returns the appropriate viewController depending on the index of the services
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> UIViewController {
        // Create a new view controller and pass suitable data.
        switch services[index].type{
        case .Crash:
            let crashViewController = self.storyboard?.instantiateViewController(withIdentifier: "crashViewController") as! CrashViewController
            return crashViewController
            
        case .Analytics:
            let analyticsViewController = self.storyboard?.instantiateViewController(withIdentifier: "analyticsViewController") as! AnalyticsViewController
            return analyticsViewController
            
        default:
            let selectedservice = services[index] as Service
            let serviceViewController = self.storyboard?.instantiateViewController(withIdentifier: "serviceViewController") as! ServiceViewController
            serviceViewController.service = selectedservice
            serviceViewController.pageIndex = index
            
            return serviceViewController
        }
        
    }
    
    func indexOfViewController(_ viewController: UIViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        
        var index: Int
        
        if viewController is CrashViewController {
            index = 3
        }
        
        else if viewController is AnalyticsViewController {
            index = 4
        }
        
        else {
            let viewController = viewController as! ServiceViewController
            index = viewController.pageIndex as Int
        }
        
        return index
    }

    
    //MARK: - UIPageViewController protocol functions
    
    // Ensure that there is a page to swipe to and from
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = self.indexOfViewController(viewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = self.indexOfViewController(viewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index += 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.services.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

