//
//  WebViewViewController.swift
//  ChoosyNewsy
//
//  Created by Evan Gibler on 4/16/15.
//  Copyright (c) 2015 Tim Gilman. All rights reserved.
//

import UIKit

class WebViewViewController: UIViewController {

    var url = "" //Initially set URL to empty string
    
    //missing IBOutlet (create later obviously) Use this name in the viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //IBOutletName.loadRequest(NSURLRequest(URL: NSURL(string: url)!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
