//
//  SearchResultsViewController.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/19/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

protocol SearchResultsDelegate {
    // Two types: "Vendors" or "Markets"
    var type: String { get }
    var results: [SearchResult] { get }
}

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var searchResultsDelegate: SearchResultsDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // ---------------------------------------------------
    // =========================
    // Standard Table View Stuff
    // =========================
    
    // Number of Sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
    }
    
    // Number of Rows in Section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    // Define How to Populate Cells
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("campusCell", forIndexPath: indexPath) as? UITableViewCell ?? UITableViewCell(style: .Subtitle, reuseIdentifier: "campusCell")
        
        // Here's the meat
//        cell.textLabel?.text = gaCampuses[indexPath.section][indexPath.row]
//        
//        cell.backgroundColor = UIColor.grayColor()
//        cell.textLabel?.textColor = UIColor.whiteColor()
        
        return cell
    }
    // ---------------------------------------------------
    
    //on click
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        /*
        var url: NSURL?
        
        if let jsonData = self.json {
        if let newArticles = jsonData["new"] as? NSArray {
        if let article = newArticles[indexPath.row] as? NSDictionary {
        if let link = article["link"] as? NSString {
        url = NSURL(string: link)
        }
        }
        }
        }
        
        performSegueWithIdentifier("web", sender: NSURLRequest(URL: url!))
        */
        performSegueWithIdentifier("web", sender: indexPath.row)
    }
    
    
    // Stuff to do right before we transition to next view
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
}
