//
//  MarketAnnotation.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/21/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class MapViewMarketAnnotation: MKPointAnnotation {
    
    var market: Market
    var hasCoordinate: Bool
    

    init(market: Market) {
        // Set Market
        self.market = market
        
        // Default hasCoordinate to false
        self.hasCoordinate = false
        
        // Superclass init
        super.init()

        // Set details from market
        self.title      = market.name
        self.subtitle   = market.prettyPrintAddress()
        
        // Unwrap the coordinate
        if let coord = market.location?.coordinate {
            self.coordinate = coord
            self.hasCoordinate = true
        }
    }
}