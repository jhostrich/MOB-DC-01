//
//  Market.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/19/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import Foundation
import AddressBook

class Market: SearchResult {
    var location: CLLocation?
    
    var address: Address?
    
    // Keys: “walkable”, “metroAccessible”, “freeParking”, “handicapAccessible”, “petFriendly”
    var extras: [String: Bool] = [:]
    
    var parkingInfo: String = ""
    var nearestMetro: String = ""
        
    // Print a nice version of the address
    func prettyPrintAddress() -> String {
        if let addr = address {
            return "\(addr.street), \(addr.city), \(addr.state) \(addr.zip)"
        }
        else {
            return ""
        }
    }

}