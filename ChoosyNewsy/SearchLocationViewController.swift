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

    @IBOutlet weak var locationTableView: UITableViewCell!
    
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
        let cell = tableView.dequeueReusableCellWithIdentifier("LocationCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = locations[indexPath.row]
        return cell
    }
    
    func setLocation(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        var location = "\(cell.textLabel?.text)"
        if location = "Columbia" {
            var latitude: CLLocationDegrees = 38.761474 //Change to be correct coordinates
            var longitude:CLLocationDegrees = -91.780938
        }
        else if location = "St. Louis" {
            var latitude: CLLocationDegrees = 38.761474 //Change to be correct coordinates

            var longitude:CLLocationDegrees = -91.780938
        }
        else if location = "Kansas City" {
            var latitude: CLLocationDegrees = 38.761474 //Change to be correct coordinates
            var longitude:CLLocationDegrees = -91.780938
        }
        else if location = "Springfield" {
            var latitude: CLLocationDegrees = 38.761474 //Change to be correct coordinates

            var longitude:CLLocationDegrees = -91.780938
        }
    }
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
