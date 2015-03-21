//
//  QueryVendors.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/20/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import Foundation

class ParseQuery {
    
    // -------------
    // Query Vendors
    // -------------
    
    class func vendors(query: PFQuery, completionHandler: (([SearchResult]) -> Void)) {
    
        // Initialize results array
        var vendorResults: [Vendor] = []
        
        // Check that the query class is Vendor
        if query.parseClassName != "Vendor" {
            println("Hey, this function only queries vendors...")
            completionHandler(vendorResults)
        }
        
        query.findObjectsInBackgroundWithBlock { (results: [AnyObject]!, error: NSError!) -> Void in
            println("Inside the query shit")
            println("Inside results: \(results)")
            println("Inside error: \(error)")
            // Error checking
            if error != nil {
                println("Oh noes, there was an error querying parse for Vendors!")
                completionHandler(vendorResults)
            }
            else {
                for result in results {
                    var vendor = Vendor()
                    
                    // name
                    if let name = result["name"] as? String {
                        vendor.name = name
                    }
                    
                    // website
                    if let website = result["website"] as? String {
                        vendor.website = website
                    }
                    
                    // contactInfo
                    if let contactInfo = result["contactInfo"] as? String {
                        vendor.contactInfo = contactInfo
                    }
                
                    // productInfo
                    if let productInfo = result["productInfo"] as? String {
                        vendor.productInfo = productInfo
                    }
                
                    // productCategories
                    if let productCategories = result["productCategories"] as? [String:Bool] {
                        vendor.productCategories = productCategories
                    }
                
                    // Append to results
                    vendorResults.append(vendor)
                }
                // Call completion handler
                completionHandler(vendorResults)
            }
            
        }
    }
    
    
    
    // -------------
    // Query Markets
    // -------------
    
    class func markets(query: PFQuery, completionHandler: (([SearchResult]) -> Void)) {
        
        // Initialize results array
        var marketResults: [Market] = []
        
        // Check that the query class is Market
        if query.parseClassName != "Market" {
            println("Hey, this function only queries markets...")
            completionHandler(marketResults)
        }
        
        query.findObjectsInBackgroundWithBlock { (results: [AnyObject]!, error: NSError!) -> Void in
            // Error checking
            if error != nil {
                println("Oh noes, there was an error querying parse for Markets!")
                completionHandler(marketResults)
            }
            else {
                for result in results {
                    var market = Market()
                    
                    // name
                    if let name = result["name"] as? String {
                        market.name = name
                    }
                    
                    // website
                    if let website = result["website"] as? String {
                        market.website = website
                    }
                    
                    // contactInfo
                    if let contactInfo = result["contactInfo"] as? String {
                        market.contactInfo = contactInfo
                    }
                    
                    // geoLocation
                    if let geoLocation = result["geoLocation"] as? PFGeoPoint {
                        market.geoLocation = geoLocation
                    }
                    
                    // address
                    if let address = result["address"] as? String {
                        market.address = address
                    }
                    
                    // openTimes
                    if let openTimes = result["openTimes"] as? [String: [Int]] {
                        // I couldn't immediate cast the value into [String: (Int, Int)]
                        // so I'm working some magic to get it done
                        var times: [String: (Int, Int)] = [:]
                        for key in openTimes.keys {
                            times[key] = (openTimes[key]![0], openTimes[key]![1])
                        }
                        market.openTimes = times
                    }
                    
                    // openCategories
                    if let openCategories = result["openCategories"] as? [String:Bool] {
                        market.openCategories = openCategories
                    }
                    
                    // extras
                    if let extras = result["extras"] as? [String:Bool] {
                        market.extras = extras
                    }
                    
                    // parkingInfo
                    if let parkingInfo = result["parkingInfo"] as? String {
                        market.parkingInfo = parkingInfo
                    }
                    
                    // nearestMetro
                    if let nearestMetro = result["nearestMetro"] as? String {
                        market.nearestMetro = nearestMetro
                    }
                    
                    // paymentTypes
                    if let paymentTypes = result["paymentTypes"] as? [String:Bool] {
                        market.paymentTypes = paymentTypes
                    }
                    
                    
                    // Append to results
                    marketResults.append(market)
                }
                
                // Call completion handler
                completionHandler(marketResults)
            }
            
        }
    }

}