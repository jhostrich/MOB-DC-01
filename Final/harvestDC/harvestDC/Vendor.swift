//
//  Vendor.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/19/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import Foundation


class Vendor: SearchResult {
    var productInfo: String = ""
    
    // Possible categories: “fruit”, “veggies”, “meatAndEggs”, “dairy”, “plantsAndHerbs”, “honeyAndJam”, “breadAndPasta”, “readyToEat”, “soapAndLotion”, “jewelry”, “compostStation”
    var productCategories: [String: Bool] = [:]
    /*
    init(name: String, website: String, contactInfo: String, productInfo: String, productCategories: [String:Bool]) {
        super.init(name: name, website: website, contactInfo: contactInfo)
        self.productInfo = productInfo
        self.productCategories = productCategories
    }
*/
}