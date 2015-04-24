//
//  HomeViewController.swift
//  ChoosyNewsy
//
//  Created by Tim Gilman on 4/13/15.
//  Copyright (c) 2015 Tim Gilman. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: UITableViewController, NSXMLParserDelegate, CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var articleTableView: UITableView!
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var radiusSlider: UISlider!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    var feed : NSArray = []
    var url: NSURL = NSURL ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        self.tableView.rowHeight = 70
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        url = NSURL(string: "http://www1.skysports.com/rss/11661")!
        
        parseRSS(url)
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl!.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.articleTableView.addSubview(refreshControl!)
        self.refreshControl!.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func refresh(sender:AnyObject)
    {
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }


    func parseRSS(data: NSURL) {
        var parse : XmlParserManager = XmlParserManager.alloc().initWithURL(data) as XmlParserManager
        feed = parse.feed
        articleTableView.reloadData()
    }
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: { (placemarks, error) -> Void in

            if (error != nil) {
                println("Error:" + error.localizedDescription)
        
                return
                
            }
            
            if placemarks.count > 0 {
                
                let pm = placemarks[0] as CLPlacemark
                
                self.displayLocationInfo(pm)
                
                self.navBar.topItem?.title = self.displayLocationTitle(pm)
                
                
            }else {
                
                println("Error with data")
                
            }
            
        })
        
    }
    
    func displayLocationTitle(placemark: CLPlacemark) -> String
    {
        return placemark.locality + ", " + placemark.administrativeArea
    }
    
    func displayLocationInfo(placemark: CLPlacemark) {
        self.locationManager.stopUpdatingLocation()
        
        println(placemark.locality)
        println(placemark.postalCode)
        println(placemark.administrativeArea)
        println(placemark.country)
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error: " + error.localizedDescription)
    }

    @IBAction func showRadius(sender: AnyObject) {
        var currentValue = radiusSlider.value
        sliderLabel.text = String(format: "%.0f", currentValue) + " miles"
    
    }

    @IBAction func searchLocation(sender: AnyObject) {
        println("Search Functionality")
    }

    @IBAction func goToHistory(sender: AnyObject) {
        println("Go to history page")
    }
    
    
    @IBAction func goToFavorited(sender: AnyObject) {
        println("Go to favorite page")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        var dictionary : NSDictionary! = feed.objectAtIndex(indexPath.row).objectForKey("title") as NSDictionary
        cell.textLabel?.text = feed.objectAtIndex(indexPath.row).objectForKey("title") as? String
        cell.detailTextLabel?.text = feed.objectAtIndex(indexPath.row).objectForKey("date") as? String
        return cell
        
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
 
            if let tv=self.tableView
            {
                feed.removeAtIndex(indexPath!.row) //Fix this
                tv.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                
            }
        }
    }
}
