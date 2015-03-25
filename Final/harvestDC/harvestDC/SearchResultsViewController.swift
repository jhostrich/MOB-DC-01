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
import CoreLocation
import AddressBook


class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate {
    
    // UIView with filter button
    var subNavController: UIView!
    var filterBtn: UIButton!
    var listMapControl: NYSegmentedControl!
    
    // Table View
    var tableView: UITableView?
    var tableCell: UITableViewCell?
    
    // Map View
    var mapView: MyMapView?
    var mapCoordinates: [CLLocationCoordinate2D] = []
    
    // Mode: "Vendors" or "Markets"
    var mode: String?
    
    // Query
    var query: PFQuery?
    
    // Search Results
    var searchResults: [SearchResult] = []
    
    
    // -------------
    // View Did Load
    // -------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        // ---------------------------
        // Perform Query Based on Mode
        // ---------------------------

        // Check for mode and query
        if let query = self.query {
            if let mode = self.mode {
                // Markets
                if mode == "Markets" {
                    ParseQuery.markets(query, completionHandler: self.processQueryResults)
                }
                // Vendors
                else if mode == "Vendors" {
                    ParseQuery.vendors(query, completionHandler: self.processQueryResults)
                }
                // Default Error
                else {
                    println("Invalid query mode \(mode)")
                }

            }
            // No mode error
            else {
                println("No mode passed to SearchResultsViewController!")
            }
        }
        // No query error
        else {
            println("No query passed to SearchResultsViewController!")
        }

    }
    
    
    // ---------------------
    // Process Query Results
    // ---------------------
    
    // Check that we got results
    // Display an error message if we didn't
    func processQueryResults(results: [SearchResult]) {
        println("Query returned!")
        println("\(results)\n")
        
        // Check that we got any results
        if results.count == 0 {
            self.drawQueryErrorMessage("Good heavens!\nThat search didn't return any results...")
        }
        // Otherwise, draw everything up
        else {
            // Copy results over
            self.searchResults = results
            
            // Draw the appropriate view elements
            self.drawSubNavController()
            self.drawTableView()
        }
    }
    
    
    // ---------------------
    // Display Error Message
    // ---------------------
    
    func drawQueryErrorMessage(message: String) {
        // Error Message label
        let errorLabel = MyInfoLabel(text: message, font: "Raleway-SemiBold", fontSize: 20)
        self.view.addSubview(errorLabel)
        
        // Add constraints
        errorLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp_topMargin).with.offset(64)
            make.left.equalTo(self.view.snp_leftMargin)
            make.right.equalTo(self.view.snp_rightMargin)
        }
    }
    
    
    // ---------------------
    // Draw subNavController
    // ---------------------
    
    // Displays filter and list/map switch
    func drawSubNavController() {
        // Setup the subNavController
        subNavController = UIView()
        subNavController.backgroundColor = MyColors.darkGreen()
        self.view.addSubview(subNavController)
        let pants = self.navigationController?.navigationBar.viewForBaselineLayout()
        
        // Add constraints for subNavController
        subNavController.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width)
            make.centerX.equalTo(self.view.snp_centerX)
            // Puts the top right at the bottom of the navigation controller
            make.top.equalTo(self.view.snp_topMargin).with.offset(64)
            make.height.equalTo(50)
        }
        
        
        // Add filterBtn to subNavController
        self.drawFilterButton()
        
        // listMapSwitch
        // Only draw the listMapSwitch for the markets
        if self.mode == "Markets" {
            self.drawListMapSwitch()
        }

    }
    
    
    // ------------------
    // Draw Filter Button
    // ------------------
    
    func drawFilterButton() {
        filterBtn = UIButton()
        filterBtn.setTitle("Filter", forState: .Normal)
        filterBtn.titleLabel!.font = UIFont(name: "Raleway-SemiBold", size: 16.0)
        filterBtn.backgroundColor = UIColor.clearColor()
        filterBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        filterBtn.setTitleColor(MyColors.green(), forState: .Highlighted)
        filterBtn.addTarget(self, action: "showFilterVC", forControlEvents: .TouchUpInside)
        subNavController.addSubview(self.filterBtn)
        
        // filterBtn Constraints
        filterBtn.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.subNavController.snp_centerY)
            make.left.equalTo(self.subNavController.snp_left).offset(20)
        }
    }
    
    
    // --------------------
    // Draw List Map Switch
    // --------------------
    
    func drawListMapSwitch() {
        // Define available options and font
        listMapControl = NYSegmentedControl(items: ["List", "Map"])
        listMapControl.titleFont = UIFont(name: "Raleway-SemiBold", size: 14.0)
        listMapControl.sizeToFit()
        
        // Set list to always be selected first
        listMapControl.selectedSegmentIndex = 0
        
        // Border and shape
        listMapControl.borderWidth = 2.0
        listMapControl.borderColor = MyColors.green()
        listMapControl.cornerRadius = 15
        
        // Colors
        listMapControl.backgroundColor = MyColors.darkGreen()
        listMapControl.titleTextColor = MyColors.lightGreen()
        listMapControl.selectedTitleTextColor = UIColor.whiteColor()
        
        // Segment Indicator
        listMapControl.segmentIndicatorInset = 2.0
        listMapControl.segmentIndicatorAnimationDuration = 0.3
        listMapControl.segmentIndicatorBorderWidth = 0.0
        listMapControl.segmentIndicatorBackgroundColor = MyColors.green()
        
        // Define what happens when we hit the switch
        listMapControl.addTarget(self, action: "switchListMap", forControlEvents: UIControlEvents.ValueChanged)
        
        // Add that ish to the superview
        subNavController.addSubview(listMapControl)
        
        // listMapControl Constraints
        listMapControl.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.subNavController.snp_centerY)
            make.right.equalTo(self.subNavController.snp_right).offset(-20)
        }
    }
    
    
    // --------------
    // Show Filter VC
    // --------------
    
    func showFilterVC() {
        // TODO: Pass current filter options
        
        // Initialize vc
        let vc = FilterViewController()
        
        // Initialize navigation controller
        let navController = UINavigationController(rootViewController: vc)

        // Push it onto the navigation controller stack
        self.navigationController?.presentViewController(navController, animated: true, completion: nil)
    }
    
    
    // ---------------
    // Draw Table View
    // ---------------
    
    func drawTableView() {
        self.tableView = UITableView()
        self.tableView?.backgroundColor = MyColors.lightGrey()
        self.view.addSubview(self.tableView!)
        
        // Size the rows based on autolayout constraints
        // Bitchin'
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        
        // Constraints
        self.tableView?.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.subNavController.snp_bottom)
            make.bottom.equalTo(self.view.snp_bottom)
            make.width.equalTo(self.view.snp_width)
        }
        
        // Register Cell
        self.tableView?.registerClass(ResultTableViewCell.self, forCellReuseIdentifier: "resultsCell")

        // Setup delegates
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
    }
    
    // -------------
    // Draw Map View
    // -------------
    
    func drawMapView() {
        self.mapView = MyMapView()
        self.mapView?.delegate = self
        self.view.addSubview(self.mapView!)

        
        // Constraints
        self.mapView?.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.subNavController.snp_bottom)
            make.bottom.equalTo(self.view.snp_bottom)
            make.left.equalTo(self.view.snp_left)
            make.right.equalTo(self.view.snp_right)
        }
        
        // Populate the map view
        self.mapView?.populateMapView(self.searchResults, mode: "Markets")
    }
    
    
    // -----------------------
    // Switch Between List/Map
    // -----------------------
    
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

    
    
    // ------------
    // Map View Fun
    // ------------
    
    
    // Customize the map pins... eggplant style
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        // We need this in case it's accessed by some default annotation given to us
        if annotation is MKUserLocation{
            return nil
        }
        
        // Define the pin View
        let reuseId = "pin"
        var annotationView = self.mapView?.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        
        // Check that we have the pinView
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            annotationView!.canShowCallout = true
            annotationView!.animatesDrop = true
            annotationView!.image = UIImage(named: "eggplant.png")
            annotationView!.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as UIButton
        } else {
            annotationView!.annotation = annotation
        }
        return annotationView!
    }

    
    // What happens when you click on the callout accessory
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        // Cast view to our custom view
        let myView = view.annotation as MapViewMarketAnnotation
        
        // Initialize the view controller
        let vc = MarketInfoViewController()
        
        // Cast to a Vendor
        vc.resultOptional = myView.market
        navigationController?.pushViewController(vc, animated: true )

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
        let cell = tableView.dequeueReusableCellWithIdentifier("resultsCell", forIndexPath: indexPath) as? ResultTableViewCell ?? ResultTableViewCell(style: .Default, reuseIdentifier: "resultsCell")
        

        // Here's the meat
        let result = self.searchResults[indexPath.section]
        cell.nameLabel.attributedText = MyAttributedString.stringWithLineSpacing(result.name, lineSpacing: 0.9)
        cell.subLabel.text = result.generalDescription
        cell.openLabel.text = result.openText()
        cell.openTimesLabel.text = result.prettyPrintOpenTimes()
        
        // Change the text color of openLabel based on if it's open
        cell.openLabel.textColor = result.isOpen() ? MyColors.green() : MyColors.red()
        
        return cell
    }
    // ---------------------------------------------------
    
    // Change space between cells
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5.0
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = MyColors.lightGrey()
        
        return footerView
    }
    
    // Have to use this function to estimate the row height so UITableViewAutomaticDimension
    //  doesn't freak the frak out and change the row heights on us
    // It's an iOS bug <http://tewha.net/2015/01/how-to-fix-uitableview-rows-changing-size/>
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // 40.0 is completely arbitrary
        return 40.0
    }
    
    // Navigate to info VC when cells are clicked
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // For Vendors Mode
        if mode == "Vendors" {
            // Initialize the view controller
            let vc = VendorInfoViewController()
            
            // Cast to a Vendor
            vc.resultOptional = searchResults[indexPath.section] as? Vendor
            navigationController?.pushViewController(vc, animated: true )
        }
        
        // For Markets Mode
        else if mode == "Markets" {
            // Initialize the view controller
            let vc = MarketInfoViewController()
            
            // Cast to a Vendor
            vc.resultOptional = searchResults[indexPath.section] as? Market
            navigationController?.pushViewController(vc, animated: true )
        }
    }
}
