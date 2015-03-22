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
    var mapView: MKMapView?
    
    // Mode: "Vendors" or "Markets"
    var mode: String?
    
    // Search Results
    var searchResults: [SearchResult] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DEBUG: Set mode manually
        self.mode = "Vendors"
    
        // Draw subNavController
        // Includes Filter Button and List/Map Switch
        drawSubNavController()
        
        // Draw Table View
        drawTableView()
        
        
        // DEBUG: Query for some results
        if mode == "Vendors" {
            println("Performing vendor query!")
            var query = PFQuery(className: "Vendor")
            query.whereKeyExists("name")
            
            ParseQuery.vendors(query, completionHandler: { (results) -> Void in
                println("Query returned!")
                println(results)
                self.searchResults += results
                self.tableView?.reloadData()
            })
        }
        else if mode == "Markets" {
            println("Performing market query!")
            var query = PFQuery(className: "Market")
            query.whereKeyExists("name")
            
            ParseQuery.markets(query, completionHandler: { (results) -> Void in
                println("Query returned!")
                println(results)
                self.searchResults += results
                self.tableView?.reloadData()
            })
        }

    }
    
    
    // Draw subNavController
    func drawSubNavController() {
        // Setup the subNavController
        subNavController = UIView()
        subNavController.backgroundColor = MyColors.darkGreen()
        self.view.addSubview(subNavController)
        
        // Add constraints for subNavController
        subNavController.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width)
            make.centerX.equalTo(self.view.snp_centerX)
            // Puts the top right at the bottom of the navigation controller
            make.top.equalTo(self.view.snp_topMargin).with.offset(64)
            make.height.equalTo(50)
        }
        
        
        // Add filterBtn to subNavController
        filterBtn = UIButton()
        filterBtn.setTitle("Filter", forState: .Normal)
        filterBtn.titleLabel!.font = UIFont(name: "Raleway-SemiBold", size: 16.0)
        filterBtn.backgroundColor = UIColor.clearColor()
        filterBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        filterBtn.setTitleColor(MyColors.green(), forState: .Highlighted)
        subNavController.addSubview(self.filterBtn)
        
        // filterBtn Constraints
        filterBtn.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.subNavController.snp_centerY)
            make.left.equalTo(self.subNavController.snp_left).offset(20)
        }
        
        
        // listMapSwitch
        // Only draw the listMapSwitch for the markets
        if self.mode == "Markets" {
            listMapControl = NYSegmentedControl(items: ["List", "Map"])
            listMapControl.titleFont = UIFont(name: "Raleway-SemiBold", size: 14.0)
            listMapControl.selectedSegmentIndex = 0
            listMapControl.borderWidth = 2.0
            listMapControl.borderColor = MyColors.green()
            listMapControl.cornerRadius = 15
            listMapControl.backgroundColor = MyColors.darkGreen()
            listMapControl.titleTextColor = MyColors.lightGreen()
            listMapControl.selectedTitleTextColor = UIColor.whiteColor()
            listMapControl.segmentIndicatorInset = 2.0
            listMapControl.segmentIndicatorAnimationDuration = 0.3
            listMapControl.segmentIndicatorBorderWidth = 0.0
            listMapControl.segmentIndicatorBackgroundColor = MyColors.green()
            listMapControl.sizeToFit()
            
            listMapControl.addTarget(self, action: "switchListMap", forControlEvents: UIControlEvents.ValueChanged)
            subNavController.addSubview(listMapControl)
            
            // listMapControl Constraints
            listMapControl.snp_makeConstraints { (make) -> Void in
                make.centerY.equalTo(self.subNavController.snp_centerY)
                make.right.equalTo(self.subNavController.snp_right).offset(-20)
            }
        }

    }
    
    
    // Draw Table View
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
    
    // Draw Map View
    func drawMapView() {
        self.mapView = MKMapView()
        self.mapView?.delegate = self
        self.view.addSubview(self.mapView!)

        
        // Constraints
        self.mapView?.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.subNavController.snp_bottom)
            make.bottom.equalTo(self.view.snp_bottom)
            make.width.equalTo(self.view.snp_width)
        }
        
        // Populate the map view
        populateMapView()
    }
    
    // Populate the map view
    func populateMapView() {
        // Cast results to Market
        if let results = searchResults as? [Market] {
            // Loop through searchResults
            for result in results {
                if let loc = result.location {
                    let annotation = MarketAnnotation(market: result)
                    self.mapView?.addAnnotation(annotation)
                    // DEBUG
                    self.centerMapOnLocation(loc)
                }
            }
        }
    }
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 1000, 1000)
        self.mapView?.setRegion(coordinateRegion, animated: true)
    }
    
    
    
    // ------------
    // Map View Fun
    // ------------
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        // We need this in case it's accessed by some default annotation given to us
        if annotation is MKUserLocation{
            return nil
        }
        
        // Define the pin View
        let reuseId = "pin"
        var annotationView = self.mapView?.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        
        // Check that we have the pinView
        if(annotationView == nil){
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            annotationView!.canShowCallout = true
            annotationView!.animatesDrop = true
            annotationView!.pinColor = .Green
            annotationView!.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as UIButton
        } else {
            annotationView!.annotation = annotation
        }
        return annotationView!
    }
    
    // What happens when you click on the callout accessory
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        // Cast view to our custom view
        let myView = view.annotation as MarketAnnotation
        
        // Initialize the view controller
        let vc = MarketInfoViewController()
        
        // Cast to a Vendor
        vc.resultOptional = myView.market
        navigationController?.pushViewController(vc, animated: true )

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
    
    //on click
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Clicked on the bitch \(searchResults[indexPath.section].name)")
        
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
