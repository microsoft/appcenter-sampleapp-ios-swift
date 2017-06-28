//
//  MasterViewController.swift
//  test123
//
//  Created by Tina on 2017-06-19.
//  Copyright © 2017 Tina. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController?
    // construct Data Model array
    var beacons: [Beacon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        // Here, we manually add our beacons to the Data Model
        beacons.append(Beacon(name: "Build", type: BeaconType.Build))
        beacons.append(Beacon(name: "Test", type: BeaconType.Test))
        beacons.append(Beacon(name: "Distribute", type: BeaconType.Distribute))
        beacons.append(Beacon(name: "Crash", type: BeaconType.Crash))
        beacons.append(Beacon(name: "Analytics", type: BeaconType.Analytics))
        beacons.append(Beacon(name: "Push", type: BeaconType.Push))

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
                let selectedBeacon = beacons[indexPath.row] as Beacon
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.beacon = selectedBeacon

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
        return beacons.count
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
        let beacon = beacons[indexPath.row]
        cell.textLabel?.text = beacon.name
        // Configure cell
        return cell
    }
}
