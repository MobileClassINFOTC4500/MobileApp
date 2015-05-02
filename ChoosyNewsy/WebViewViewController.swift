//
//  WebViewViewController.swift
//  ChoosyNewsy
//
//  Created by Evan Gibler on 4/16/15.
//  Copyright (c) 2015 Tim Gilman. All rights reserved.
//

import UIKit

class WebViewViewController: UIViewController {

    var url: String = "" //Initially set URL to empty string
    
    @IBOutlet weak var WebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WebView.loadRequest(NSURLRequest(URL: NSURL(string: url)!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
