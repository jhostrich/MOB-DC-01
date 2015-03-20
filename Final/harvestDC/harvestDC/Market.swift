//
//  Market.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/19/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import Foundation

class Market: SearchResult {
    var geoLocation: PFGeoPoint = PFGeoPoint()
    var address: String = ""
    
    // Keys are strings Mon, Tues, Wed, Thur, Fri, Sat, Sun
    // Values are (open, close) in military time
    var openTimes: [String: (Int, Int)] = [:]
    
    // Keys: “weekdaysAM”, “weekdaysPM”, “weekends”
    var openCategories: [String: Bool] = [:]
    
    // Keys: “walkable”, “metroAccessible”, “freeParking”, “handicapAccessible”, “petFriendly”
    var extras: [String: Bool] = [:]
    
    var parkingInfo: String = ""
    var nearestMetro: String = ""
    
    // Keys: “creditCards”, “snap”, “seniorFmnp”, “wic”, “fvrx”
    var paymentTypes: [String: Bool] = [:]
}