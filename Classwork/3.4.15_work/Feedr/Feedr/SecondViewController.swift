//
//  SecondViewController.swift
//  Feedr
//
//  Created by Johanna Ostrich on 3/4/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit
import SwiftyJSON

class SecondViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var json: JSON?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = NSURL(string: "http://mashable.com/stories.json") {
            
            // create task, pulling content from Mashable
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in


            // this was the old, tower of doom way to do it
//                if let jsonDict: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) {
//                    self.json = jsonDict as? NSDictionary
//                }
                
                let newJsonDict = JSON(data: data)
                self.json = newJsonDict
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                })
            })
            task.resume()
        }
        
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // setting number of rows
        if let jsonData = self.json {
            // this was the old, tower of doom way to do it
//            if let newArray = jsonData["new"] as? NSArray {
//                println(newArray.count)
//                return newArray.count
//            }
            return jsonData["new"].count
        }

        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        if cell == nil  {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
        }
        
        // pulling titles, setting in table view
        if let jsonDict = self.json {
            var title = jsonDict["new"][indexPath.row]["title"].string
            
            var author = jsonDict["new"][indexPath.row]["author"].string

            cell.textLabel?.text = title
            cell.detailTextLabel?.text = author

            
            
            // this was the old, tower of doom way to do it
//            if let newArray = jsonDict["new"] as? NSArray {
//                if let child = newArray[indexPath.row] as? NSDictionary {
//                    if let title = child["title"] as? NSString {
//                        cell.textLabel?.text = title
//                    }
//                    if let author = child["author"] as? NSString {
//                        cell.detailTextLabel?.text = author
//                    }
//                }
//            }
        }
        
        return cell
    }
    
    //on click
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let jsonDict = self.json {
            var link = jsonDict["new"][indexPath.row]["link"].string
            var url = NSURL(string: link!)
            performSegueWithIdentifier("web", sender: NSURLRequest(URL: url!))
            
            
//            if let newArray = jsonDict["new"] as? NSArray {
//                if let child = newArray[indexPath.row] as? NSDictionary {
//                    if let link = child["link"] as? NSString {
//                        var url = NSURL(string: link)
//                        performSegueWithIdentifier("web", sender: NSURLRequest(URL: url!))
//                    }
//                }
//            }
        }

        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let request = sender as? NSURLRequest {
            var destinationViewController = segue.destinationViewController as WebViewController
            destinationViewController.request = request
        }
    }

    
    
    
    
    
    
    
    
}
