//
//  CityHistoryViewController.swift
//  ChoosyNewsy
//
//  Created by Evan Gibler on 5/1/15.
//  Copyright (c) 2015 Tim Gilman. All rights reserved.
//

import UIKit

class CityHistoryViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var CityArticleTableView: UITableView!
    
    var articles = ["google.com", "bing.com", "weather.com"]
    
    class selectedArticle {
        var url: String = ""
    }
    
    var articleURL = selectedArticle()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = articles[indexPath.row]
        return cell
        
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedArticle = articles[indexPath.row]
        performSegueWithIdentifier("showHistoryWebView", sender: self)
    }
    
    func prepareForSegue(indexPath: NSIndexPath, segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController as WebViewViewController
        //destinationViewController.url = articleURL
    }
    

}
