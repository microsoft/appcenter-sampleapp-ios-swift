
import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController?
    // construct Data Model array
    var services: [service] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        // Here, we manually add our services to the Data Model
        services.append(service(name: "Build", type: ServiceType.Build))
        services.append(service(name: "Test", type: ServiceType.Test))
        services.append(service(name: "Distribute", type: ServiceType.Distribute))
        services.append(service(name: "Crash", type: ServiceType.Crash))
        services.append(service(name: "Analytics", type: ServiceType.Analytics))
        services.append(service(name: "Push", type: ServiceType.Push))

        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedservice = services[indexPath.row] as service
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.service = selectedservice

                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return services.count
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row

        switch row {
        case 3:
            performSegue(withIdentifier: "showCrash", sender: self)
        case 4:
            performSegue(withIdentifier: "showAnalytics", sender: self)
        default:
            performSegue(withIdentifier: "showDetail", sender: self)
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let service = services[indexPath.row]
        cell.textLabel?.text = service.name
        // Configure cell
        return cell
    }
}
