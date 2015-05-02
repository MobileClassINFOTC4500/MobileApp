//
//  HistoryViewController.swift
//  ChoosyNewsy
//
//  Created by Evan Gibler on 4/26/15.
//  Copyright (c) 2015 Tim Gilman. All rights reserved.
//

import UIKit
import Foundation

class HistoryViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var HistoryTableView: UITableView!
    
    var cities = ["Columbia", "St. Louis", "Kansas City", "Springfield"]
    var articleNum = ["3", "1", "2", "3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = cities[indexPath.row]
        cell.detailTextLabel?.text = "\(articleNum[indexPath.row]) Articles"
        return cell
        
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCity = cities[indexPath.row]
        performSegueWithIdentifier("showCityArticles", sender: self)
    }
    
    func prepareForSegue(indexPath: NSIndexPath, segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController as CityHistoryViewController
        destinationViewController.title = cities[indexPath.row]
    }
}
