//
//  RSSFeedViewController.swift
//  ChoosyNewsy
//
//  Created by Evan Gibler on 4/16/15.
//  Copyright (c) 2015 Tim Gilman. All rights reserved.
//

import UIKit

class RSSFeedViewController: UIViewController {

    //@IBOutletName
    
    var feedTitle = String()
    var feedContent = String()
    var url = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //CREATE A TEXT VIEW FOR THIS?//
        
        //textView.editable = false
        //textView.contentInset = UIEdgeInsets(top: +60, left: 0, bottom: 0, right: 0)
        //textView.text = "\(feedTitle)\n\n\(feedContent)"
    }

   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //if segue.identifier == "[SEGUE ID]"
        
        let webView: WebViewViewController = segue.destinationViewController as WebViewViewController
        url = url.stringByReplacingOccurrencesOfString(" ", withString: "")
        url = url.stringByReplacingOccurrencesOfString("\n", withString: "")
        webView.url = url
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
