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
    var mapView: MKMapView?
    var mapCoordinates: [CLLocationCoordinate2D] = []
    
    // Mode: "Vendors" or "Markets"
    var mode: String?
    
    // Query
    var query: PFQuery?
    
    // Search Results
    var searchResults: [SearchResult] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check for mode and query
        if let query = self.query {
            if let mode = self.mode {
                
                // ---------------------------
                // Perform Query Based on Mode
                // ---------------------------
                
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
    
    
    func processQueryResults(results: [SearchResult]) {
        println("Query returned!")
        println("\(results)\n")
        
        // Check that we got any results
        if results.count == 0 {
            self.drawQueryErrorMessage("Good heavens!  That search didn't return any results...")
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
        filterBtn.addTarget(self, action: "showFilterVC", forControlEvents: .TouchUpInside)
        subNavController.addSubview(self.filterBtn)
        
        // filterBtn Constraints
        filterBtn.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.subNavController.snp_centerY)
            make.left.equalTo(self.subNavController.snp_left).offset(20)
        }
        
        
        // listMapSwitch
        // Only draw the listMapSwitch for the markets
        if self.mode == "Markets" {
            self.drawListMapSwitch()
        }

    }
    
    
    func drawListMapSwitch() {
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
    
    // Show Filter VC
    func showFilterVC() {
        // TODO: Pass current filter options
        
        // Initialize vc
        let vc = FilterViewController()
        
        // Initialize navigation controller
        let navController = UINavigationController(rootViewController: vc)

        // Push it onto the navigation controller stack
        self.navigationController?.presentViewController(navController, animated: true, completion: nil)
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
            make.left.equalTo(self.view.snp_left)
            make.right.equalTo(self.view.snp_right)
        }
        
        // Populate the map view
        self.populateMapView()
        
        // Set the map view region
        self.setMapRegionToFitMarkers()
    }
    
    // Populate the map view
    func populateMapView() {
        // Empty the list of map coordinates
        self.mapCoordinates.removeAll(keepCapacity: true)
        
        // Cast results to Market
        if let results = searchResults as? [Market] {
            // Loop through searchResults
            for result in results {
                let annotation = MapViewMarketAnnotation(market: result)
                
                // Check that the annotation has a valid coordinate before
                //  we add it to the map view
                if annotation.hasCoordinate {
                    
                    // Add annotation to map view
                    self.mapView?.addAnnotation(annotation)
                    
                    // Add coordinate to list of coordinates
                    self.mapCoordinates.append(annotation.coordinate)
                    
                    
                    // DEBUG
//                    self.centerMapOnLocation(annotation.coordinate)
                }
            }
        }
    }
    
    func centerMapOnLocation(coordinate: CLLocationCoordinate2D) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)
        self.mapView?.setRegion(coordinateRegion, animated: true)
    }
    
    func setMapRegionToFitMarkers() {
        // Coordinate at the center of the region
        var centerCoordinate: CLLocationCoordinate2D
        
        // Dummy coordinates used to calculate distances
        var dummyLoc1: CLLocation
        var dummyLoc2: CLLocation
        
        // Region Radii
        var latRadius:  CLLocationDistance
        var longRadius: CLLocationDistance
        
        // Intialize all values to 0 to avoid compiler errors
        // It was yelling at me that they were being used before being initialized
        
        // Latitude min and max
        var minLat: CLLocationDegrees = 0
        var maxLat: CLLocationDegrees = 0
        
        // Longitude min and max
        var minLong: CLLocationDegrees = 0
        var maxLong: CLLocationDegrees = 0
        
        
        // ------------------------------
        // Determine the Max/Min Long/Lat
        // ------------------------------
        
        // Enumerate over all coordinates
        for (index, coordinate) in enumerate(self.mapCoordinates) {
            // Initialize all values from the first item
            if index == 0 {
                // Latitude
                minLat = coordinate.latitude
                maxLat = coordinate.latitude
                
                // Longitude
                minLong = coordinate.longitude
                maxLong = coordinate.longitude
            }
            
            // Otherwise, compare the new coordinate to the current values and modify accordingly
            else {
                // Min Latitude
                if coordinate.latitude < minLat {
                    minLat = coordinate.latitude
                }
                
                // Max Latitude
                if coordinate.latitude > maxLat {
                    maxLat = coordinate.latitude
                }
                
                // Min Longitude
                if coordinate.longitude < minLong {
                    minLong = coordinate.longitude
                }
                
                // Max Longitude
                if coordinate.longitude > maxLong {
                    maxLong = coordinate.longitude
                }
            }
        }
        
        
        // --------------------
        // Calculate the Region
        // --------------------
        
        // Center Coordinate
        centerCoordinate = CLLocationCoordinate2D(latitude: (minLat + maxLat)/2, longitude: (minLong + maxLong)/2)
        
        // Latitude Radius
        dummyLoc1 = CLLocation(latitude: minLat, longitude: 0)
        dummyLoc2 = CLLocation(latitude: maxLat, longitude: 0)
        latRadius = dummyLoc1.distanceFromLocation(dummyLoc2) * 1.3
        
        // Longitude Radius
        dummyLoc1  = CLLocation(latitude: 0, longitude: minLong)
        dummyLoc2  = CLLocation(latitude: 0, longitude: maxLong)
        longRadius = dummyLoc1.distanceFromLocation(dummyLoc2) * 1.3

        // Set the map region
        let region = MKCoordinateRegionMakeWithDistance(centerCoordinate, latRadius, longRadius)
        self.mapView?.setRegion(region, animated: true)
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
        let myView = view.annotation as MapViewMarketAnnotation
        
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
