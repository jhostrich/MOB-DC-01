//
//  SearchResults.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/19/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import Foundation

class SearchResult {
    var name: String        = ""
    var website: String     = ""
    var contactInfo: String = ""
    
    // Keys: "creditCards", "snap", "seniorFmnp", "wic", "fvrx"
    var paymentTypes: [String: Bool] = [:]
    
    // Keys are strings Mon, Tues, Wed, Thur, Fri, Sat, Sun
    // Values are (open, close) in military time
    var openTimes: [String: (Int, Int)] = [:]
    
    // Keys: “weekdaysAM”, “weekdaysPM”, “weekends”
    var openCategories: [String: Bool] = [:]
    
    func prettyPrintOpenTimes() -> String {
        return "That's a pretty nice schedule you got there"
    }

    
    // Master list of payment types
    // Allows us to always access them in the same order
    class func masterPaymentTypes() -> [String] {
        return ["creditCards", "snap", "seniorFmnp", "wic", "fvrx"]
    }
    
    class func paymentTypeDisplayName(type: String) -> String {
        switch type {
            case "creditCards":
                return "Credit Cards"
            case "snap":
                return "SNAP"
            case "seniorFmnp":
                return "Senior FMNP"
            case "wic":
                return "WIC"
            case "fvrx":
                return "FVRx"
            default:
                return "Invalid payment type"
        }
    }
}