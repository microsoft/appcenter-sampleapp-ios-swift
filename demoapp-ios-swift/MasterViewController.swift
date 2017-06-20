//
//  MasterViewController.swift
//  test123
//
//  Created by Tina on 2017-06-19.
//  Copyright © 2017 Tina. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var objects: [Any] = ["Build", "Test", "Distribute", "Crash", "Analytics", "Push"]
    
    // construct Data Model array, manually added for now
    var beacons: [Beacon] = []
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.beacons.append(Beacon(name: "Build", type: BeaconType.Build))
        self.beacons.append(Beacon(name: "Test", type: BeaconType.Test))
        self.beacons.append(Beacon(name: "Distribute", type: BeaconType.Distribute))
        self.beacons.append(Beacon(name: "Crash", type: BeaconType.Crash))
        self.beacons.append(Beacon(name: "Analytics", type: BeaconType.Analytics))
        self.beacons.append(Beacon(name: "Push", type: BeaconType.Push))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! Beacon
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.beacon = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.beacons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let beacon = self.beacons[indexPath.row]
        cell.textLabel?.text = beacon.name
        
        // Configure cell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false so the specified item is not editable.
        return false
    }

    
}

