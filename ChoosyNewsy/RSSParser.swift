//
//  RSSParser.swift
//  ChoosyNewsy
//
//  Created by Evan Gibler on 4/16/15.
//  Copyright (c) 2015 Tim Gilman. All rights reserved.
//

import Foundation

class RSSParser: NSObject, NSXMLParserDelegate {
    
    var parser = NSXMLParser()
    var feed = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var feedTitle = NSMutableString()
    var url = NSMutableString()
    var feedDescription = NSMutableString()
    var feedDate = NSMutableString()
    
    func initialize (url :NSURL) -> AnyObject {
        beginParse(url)
        return self
    }
    
    func beginParse (url :NSURL) {
        feed = []
        parser = NSXMLParser(contentsOfURL: url)!
        parser.delegate = self
        parser.shouldProcessNamespaces = false
        parser.shouldReportNamespacePrefixes = false
        parser.shouldResolveExternalEntities = false
        parser.parse()
    
    }
    
    func RSSFeeds() -> NSMutableArray {
        return feed
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        
        if(element as NSString).isEqualToString("item") { //can change "item" to necessary attribute
            elements = NSMutableDictionary.alloc()
            elements = [:]
            feedTitle = NSMutableString()
            feedTitle = ""
            url = NSMutableString.alloc()
            url = ""
            feedDescription = NSMutableString.alloc()
            feedDescription = ""
            feedDate = NSMutableString.alloc()
            feedDate = ""
        }
    }
        
        func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
            
            if (elementName as NSString).isEqualToString("item") { //again, can change
                if feedTitle != "" {
                    elements.setObject(feedTitle, forKey: "title") //title, headline, etc.
                }
            }
            
            if url != "" {
                elements.setObject(url, forKey: "url")
            }
            
            if feedDescription != "" {
                elements.setObject(feedDescription, forKey: "description") //desc., excerpt, etc.
            }
            
            if feedDate != "" {
                elements.setObject(feedDate, forKey: "date") //probably won't change
            }
            
            feed.addObject(elements)
            
    }

    func parser(parser: NSXMLParser, foundCharacters string: String?) { //not sure why this is conflicting right now
        
        if element.isEqualToString("title") { //same
            feedTitle.appendString(string!)
        }
        
        else if element.isEqualToString("link") { //same
            url.appendString(string!)
        }
            
        else if element.isEqualToString("description") { //same
            feedDescription.appendString(string!)
        }
            
        else if element.isEqualToString("date") { //same
            feedDate.appendString(string!)
            }
        }
    }