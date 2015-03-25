//
//  MyMapView.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/24/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

//import UIKit
import MapKit

class MyMapView: MKMapView {
    
    // List of all coordinates used to populate map view
    var mapCoordinates: [CLLocationCoordinate2D] = []
    
    
    // -----------------------------------------------------------------------------------------

    // ---------------------
    // Populate the Map View
    // ---------------------
    
    func populateMapView(searchResults: NSArray, mode: String) {
        // Empty the list of map coordinates
        self.mapCoordinates.removeAll(keepCapacity: true)
        
        // Filter on mode
        if mode == "Markets" {
        
            // Cast results to Market
            if let results = searchResults as? [Market] {
                // Loop through searchResults
                for result in results {
                    let annotation = MapViewMarketAnnotation(market: result)
                    
                    // Check that the annotation has a valid coordinate before
                    //  we add it to the map view
                    if annotation.hasCoordinate {
                        
                        // Add annotation to map view
                        self.addAnnotation(annotation)
                        
                        // Add coordinate to list of coordinates
                        self.mapCoordinates.append(annotation.coordinate)
                    }
                }
                
                // Center region around map markers
                self.setMapRegionToFitMarkers()
            }
        }
        // TODO: Stuff for vendors
        else if mode == "Vendors" {
            
        }
        // Default error
        else {
            println("Invalid result mode \(mode)")
        }
    }
    
    // -----------------------------------------------------------------------------------------
    
    // ----------------------
    // Center Map on Location
    // ----------------------
    
    func centerMapOnLocation(coordinate: CLLocationCoordinate2D) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)
        self.setRegion(coordinateRegion, animated: true)
    }
    
    // -----------------------------------------------------------------------------------------

    // -----------------------------
    // Set Map Region to Fit Markers
    // -----------------------------
    
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
        
        // -----------------------------------------------------------------------------------------
        
        
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
        self.setRegion(region, animated: true)
    }
    
}
