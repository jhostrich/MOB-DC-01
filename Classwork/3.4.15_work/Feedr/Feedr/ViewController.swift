//
//  ViewController.swift
//  Feedr
//
//  Created by Tedi Konda on 3/2/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    var tempData = ["Ena's tail is apperantly OK", "MOB Class is awesome", "Pigs sighted flying"]
    var json: NSDictionary?
    
    
    // in JSON, {} is dictionary, [] is array
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = NSURL(string: "http://www.reddit.com/.json") {
        // this is validating that it's a valid url
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                println(data)
                // note: this data is just bytes
                
                // again, important to validate--with JSON, if one bracket or whatever is out of place, Xcode will get grumbly and no longer recognize as JSON, will probably just crash
                // so we want to make sure can convert to JSON properly, I think
                if let jsonDict: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) {
                    println(jsonDict)
                    // now this is a readable JSON array of dictionaries--though it always comes back as AnyObject
                    self.json = jsonDict as? NSDictionary
                }
                
                // this has to happen here, in the task itself
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                })
            })
            task.resume()
        }
    
        // so basically the way this works is that in viewDidLoad, it starts pulling data in a side queue
        // in the meantime, the table populates (well, populates with 0)--the rest of the code in the viewController loads, ignores this side queue
        // once the data is done loading, side queue goes to main queue, task resumes, and the table populates with this new data
        // yay!
        
    }

    
    // Tower of Doom is when have array of dictionaries layers and layers deep
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // okay, don't want to make assumption that the JSON data we got was valid
        if let jsonData = self.json {
            if let data = jsonData["data"] as? NSDictionary {
                if let children = data["children"] as? NSArray {
                    return children.count
                }
            }
        }
        
        // this is a backup--it will only run if the "return children.count" doesn't have a number to return, or it didn't get there because something was invalid
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        if cell == nil  {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
        }
        
        if let jsonDict = self.json {
            if let data = jsonDict["data"] as? NSDictionary {
                if let children = data["children"] as? NSArray {
                    if let child = children[indexPath.row] as? NSDictionary {
                        if let childData = child["data"] as? NSDictionary {
                            if let title = childData["title"] as? NSString {
                                cell.textLabel?.text = title
                            }
                            if let ups = childData["ups"] as? NSInteger {
                                cell.detailTextLabel?.text = "Number of ups = \(ups)"
                            }
                        }
                    }
                }
            }
        }
        
        
        return cell
    }
    
    //on click
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let jsonDict = self.json {
            if let data = jsonDict["data"] as? NSDictionary {
                if let children = data["children"] as? NSArray {
                    if let child = children[indexPath.row] as? NSDictionary {
                        if let childData = child["data"] as? NSDictionary {
                            if let permalink = childData["permalink"] as? NSString {
                                var url = NSURL(string: "http://reddit.com" + permalink)
                                performSegueWithIdentifier("web", sender: NSURLRequest(URL: url!))
                            }
                        }
                    }
                }
            }
        }

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let request = sender as? NSURLRequest {
            var destinationViewController = segue.destinationViewController as WebViewController
            destinationViewController.request = request
        }
    }


}

