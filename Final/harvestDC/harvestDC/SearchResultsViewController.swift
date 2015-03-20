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
    
    // Delegate to bring in search results
    var searchResultsDelegate: SearchResultsDelegate?
    
    // UIView with filter button
    var subNavController: UIView!
    var filterBtn: UIButton!
    var listMapControl: UISegmentedControl!
    
    // Current Display Mode ("list" or "map")
    // Default to "list"
    var mode: String = "list"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the subNavController
        subNavController = UIView()
        subNavController.backgroundColor = UIColor.blackColor()
        self.view.addSubview(subNavController)
        
        // Add constraints for subNavController
        subNavController.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width)
            make.centerX.equalTo(self.view.snp_centerX)
            // Puts the top right at the bottom of the navigation controller
            make.top.equalTo(self.view.snp_topMargin).with.offset(64)
            make.height.equalTo(40)
        }
        
        
        // Add filterBtn to subNavController
        filterBtn = UIButton()
        filterBtn.setTitle("Filter", forState: .Normal)
        filterBtn.titleLabel!.font = UIFont(name: "Raleway-SemiBold", size: 16.0)
        filterBtn.backgroundColor = UIColor.clearColor()
        filterBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        filterBtn.setTitleColor(UIColor.lightGrayColor(), forState: .Highlighted)
        subNavController.addSubview(self.filterBtn)
        
        // filterBtn Constraints
        filterBtn.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.subNavController.snp_centerY)
            make.left.equalTo(self.subNavController.snp_left).offset(20)
        }
        
        
        
        
        // listMapSwitch
        listMapControl = UISegmentedControl(items: ["List", "Map"])
        listMapControl.selectedSegmentIndex = 0
//        listMapControl.numberOfSegments = 2
        
//        customSegmentedControl.frame = CGRectMake(60, 250,200, 30)
//        customSegmentedControl.selectedSegmentIndex = 1
//        customSegmentedControl.tintColor = UIColor.redColor()
//        customSegmentedControl.addTarget(self, action: "segmentedValueChanged:", forControlEvents: .ValueChanged)

        
        
        subNavController.addSubview(listMapControl)
        
        // listMapControl Constraints
        listMapControl.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.subNavController.snp_centerY)
            make.right.equalTo(self.subNavController.snp_right).offset(-20)
        }
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
