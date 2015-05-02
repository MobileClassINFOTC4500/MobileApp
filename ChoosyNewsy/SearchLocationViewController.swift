//
//  SearchLocationViewController.swift
//  ChoosyNewsy
//
//  Created by Tim Gilman on 4/21/15.
//  Copyright (c) 2015 Tim Gilman. All rights reserved.
//

import UIKit
import MapKit

class SearchLocationViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var citiesTableView: UITableViewCell!
    
    let locations = ["Columbia", "St. Louis", "Kansas City", "Springfield"] //Add more locations
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = locations[indexPath.row]
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func setLocation(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        if contains(locations, "Columbia") {
            var latitude: CLLocationDegrees = 38.761474 //Change to be correct coordinates
            var longitude:CLLocationDegrees = -91.780938
        }
        else if contains(locations, "St. Louis") {
            var latitude: CLLocationDegrees = 38.761474 //Change to be correct coordinates

            var longitude:CLLocationDegrees = -91.780938
        }
        else if contains(locations, "Kansas City") {
            var latitude: CLLocationDegrees = 38.761474 //Change to be correct coordinates
            var longitude:CLLocationDegrees = -91.780938
        }
        else if contains(locations, "Springfield") {
            var latitude: CLLocationDegrees = 38.761474 //Change to be correct coordinates
            var longitude:CLLocationDegrees = -91.780938
        }
    }
    
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
