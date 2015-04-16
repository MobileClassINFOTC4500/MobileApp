//
//  RSSParser.swift
//  ChoosyNewsy
//
//  Created by Evan Gibler on 4/16/15.
//  Copyright (c) 2015 Tim Gilman. All rights reserved.
//

import Foundation

class RSSParser: NSOBject, NSXMLParserDelegate {
    
    var parse = NSXMLParser()
    var feed = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var feedTitle = NSMutableArray()
    var url = NSMutableString()
    var feedDescription = NSMutableString()
    var feedDate = NSMutableString()
    
    func initialize (url :NSURL) -> AnyObject {
        beginParse(url)
        return self
    }
    
    
}