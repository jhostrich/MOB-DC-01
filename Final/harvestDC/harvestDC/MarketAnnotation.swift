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

class MarketAnnotation: MKPointAnnotation {
    
    var market: Market

    init(market: Market) {
        // Set Market
        self.market = market

        // Superclass init
        super.init()

        // Set details from market
        self.title      = market.name
        self.subtitle   = market.prettyPrintAddress()
        if let coord = market.location?.coordinate {
            self.coordinate = coord
        }
    }
}