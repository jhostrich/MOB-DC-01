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
        
    // Keys: “walkable”, “metroAccessible”, “freeParking”, “handicapAccessible”, “petFriendly”
    var extras: [String: Bool] = [:]
    
    var parkingInfo: String = ""
    var nearestMetro: String = ""
}