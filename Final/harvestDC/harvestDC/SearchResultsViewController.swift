//
//  SearchResultsViewController.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/19/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit
import MapKit
import NYSegmentedControl

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
    var listMapControl: NYSegmentedControl!
    
    // Table View
    var tableView: UITableView?
    var tableCell: UITableViewCell?
    
    // Map View
    var mapView: MKMapView?
    
    // Mode: "Vendors" or "Markets"
    var mode: String?
    
    // Search Results
    var searchResults: [String] = ["Bob", "Harry", "Job"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Draw subNavController
        // Includes Filter Button and List/Map Switch
        drawSubNavController()
        
        // Draw Table View
        drawTableView()
    }
    
    
    // Draw subNavController
    func drawSubNavController() {
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
        listMapControl = NYSegmentedControl(items: ["List", "Map"])
        listMapControl.selectedSegmentIndex = 0
        listMapControl.borderWidth = 1.0
        listMapControl.borderColor = UIColor(white: 0.15, alpha: 1.0)
        listMapControl.cornerRadius = 15
        listMapControl.backgroundColor = UIColor.blueColor()
        listMapControl.titleTextColor = UIColor.blackColor()
        listMapControl.selectedTitleTextColor = UIColor.whiteColor()
        listMapControl.segmentIndicatorInset = 2.0
        listMapControl.segmentIndicatorAnimationDuration = 0.3
        listMapControl.segmentIndicatorBorderWidth = 0.0
        listMapControl.sizeToFit()
        
        listMapControl.addTarget(self, action: "switchListMap", forControlEvents: UIControlEvents.ValueChanged)
        subNavController.addSubview(listMapControl)
        
        // listMapControl Constraints
        listMapControl.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.subNavController.snp_centerY)
            make.right.equalTo(self.subNavController.snp_right).offset(-20)
        }

    }
    
    
    // Draw Table View
    func drawTableView() {
        self.tableView = UITableView()
        
        self.view.addSubview(self.tableView!)
        
        // Constraints
        self.tableView?.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.subNavController.snp_bottom)
            make.bottom.equalTo(self.view.snp_bottom)
            make.width.equalTo(self.view.snp_width)
        }

        // Setup delegates
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        
        // Register Cell
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "resultsCell")
    }
    
    // Draw Map View
    func drawMapView() {
        self.mapView = MKMapView()
        self.view.addSubview(self.mapView!)

        
        // Constraints
        self.mapView?.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.subNavController.snp_bottom)
            make.bottom.equalTo(self.view.snp_bottom)
            make.width.equalTo(self.view.snp_width)
        }
    }
    
    
    //
    func switchListMap() {
        // List
        if self.listMapControl.selectedSegmentIndex == 0 {
            // Remove Map View
            self.mapView?.removeFromSuperview()
            
            // Draw Table View
            drawTableView()
        }
        
        // Map
        else {
            // Remove Table View
            self.tableView?.removeFromSuperview()
                
            // Draw Map View
            drawMapView()
        }
    }

    // ---------------------------------------------------
    // =========================
    // Standard Table View Stuff
    // =========================
    
    // Number of Sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.searchResults.count
    }
    
    // Number of Rows in Section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Define How to Populate Cells
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("resultsCell", forIndexPath: indexPath) as? UITableViewCell ?? UITableViewCell(style: .Subtitle, reuseIdentifier: "resultsCell")

        
        // Here's the meat
        cell.textLabel?.text = searchResults[indexPath.section]

        cell.backgroundColor = UIColor.grayColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        return cell
    }
    // ---------------------------------------------------
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5.0
    }
    
    //on click
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Clicked on the bitch \(searchResults[indexPath.section])")
    }
    
    
    // Stuff to do right before we transition to next view
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
}
