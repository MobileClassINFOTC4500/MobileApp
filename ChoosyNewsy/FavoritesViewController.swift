//
//  FavoritesViewController.swift
//  ChoosyNewsy
//
//  Created by Evan Gibler on 4/22/15.
//  Copyright (c) 2015 Tim Gilman. All rights reserved.
//

import UIKit

class FavoritesViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    var feed = []
    
    var url : NSURL = NSURL()
    var selectedURL: url?
    
    //@IBOutlet for favoritesTableView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //url = NSURL(string: "http://www1.skysports.com/rss/11661")! URL will be link to article, not RSS feed.
        //open URL in WebViewViewController
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl!.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        //self.favoritesTableView.addSubview(refreshControl!)
        self.refreshControl!.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject) {
            let destinationViewController = segue.destinationViewController as WebViewViewController
            destinationViewController.url = selectedURL
        }
        
        //Need segues to return as usual

}
