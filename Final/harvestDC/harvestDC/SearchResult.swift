//
//  SearchResults.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/19/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import Foundation

class SearchResult {
    // String values
    var name:               String = ""
    var website:            String = ""
    var contactInfo:        String = ""
    var generalDescription: String = ""

    
    // Payment Types
    var paymentTypes: [String] = []
    // Master List of Payment Types
    private let masterPaymentTypes = ["creditCards", "snap", "seniorFmnp", "wic", "fvrx"]
    
    
    // Open Times
    // i.e. {"Mon":[800,1600],"Sat":[1000,1400]}
    var openTimes: [String: [Int]] = [:]
    // Master List of openTimes Keys
    private let dayKeys = ["Mon", "Tues", "Wed", "Thur", "Fri", "Sat", "Sun"]
    
    
    // Open Categories
    var openCategories: [String] = []
    // Master list of possible openTimes Values
    private let masterOpenCategories = ["any day", "today", "weekdays, am", "weekdays, pm", "weekends"]
    // Master list of possible openTimes Values
    class func listOpenCategories() -> [String] {
        return ["any day", "today", "weekdays, am", "weekdays, pm", "weekends"]
    }
    
    
    // Makes it so you only have to calculate this status once per object
    private var openNow: Bool?
    
    // Since I added openNow, I got a stupid compile error because something
    //  couldn't access init(), so I added it...
    init() {
    }
    

    // Return open status based on isOpen
    func openText() -> String {
        if self.isOpen() {
            return "Open now  |  "
        }
        else {
            return "Closed now  |  "
        }

    }
    
    
    // -------------------------------
    // Determine if the Result is Open
    // -------------------------------
    
    func isOpen() -> Bool {
        // Makes it so you only have to calculate this status once per object
        if let status = self.openNow {
            return status
        }
        
        // Grab the current date/time
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute, .Weekday], fromDate: date)
        
        // Calculate the current date/time
        let currentTime = components.hour * 100 + components.minute
        // iOS weekday indexes from Sun-Sat, but I want Mon-Sun, so I fixed it
        // It also indexes with 1-7, so this fixes that, too
        // Adding 7 to make sure it's not negative
        let weekdayIndex = (components.weekday - 2 + 7) % 7
        
        let day = self.dayKeys[weekdayIndex]
        
        // Check to see if it's open today
        if let times = self.openTimes[day] {
            if (currentTime > times[0]) && (currentTime < times[1]) {
                return true
            }
        }
        
        return false
    }
    
    
    // --------------------
    // Print the Open Times
    // --------------------
    
    func prettyPrintOpenTimes() -> String {
        // Used to print out the days with 4 characters
        var dayPrint: String!

        // Function Output
        var out = ""
        
        // Let's us track the first time through the loop
        var first = true
        
        // Iterate through days
        for day in self.dayKeys {
            if let times = self.openTimes[day] {
                // Only add a \n if it's not the first one
                if first { first = false }
                else     { out  += "\n"  }
                
                // Make a version of the day with an extra space at the end
                // Aligns nicely with 4 characters
                if day.characters.count == 3 {
                    dayPrint = "\(day) "
                }
                else {
                    dayPrint = day
                }
                
                // Add the date/time
                let open  = self.humanReadableTime(times[0])
                let close = self.humanReadableTime(times[1])
                
                out += "\(dayPrint) \(open) - \(close)"
            }
        }
        
        return out
    }
    
    func humanReadableTime(time: Int) -> String {        
        // Hour
        let hour = time/100
        let minutes = time - hour*100
        
        // Determine am/pm
        var period: String
        if hour < 12 {
            period = "am"
        }
        else {
            period = "pm"
        }
        
        // Note there are no leading zeros for the hour but there are for the minutes
        return NSString(format: "%2d:%02d\(period)", hour%12, minutes) as String
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
    
    
    func paymentTypesDrawDetailView() -> UIView {
        
        // Array of payment types used
        var typesUsed: [String] = []
        
        // Array of labels
        var typeLabels: [UILabel] = []
        
        // Constraint constants
        let scaleFactor = 0.25
        let height = 60.0
        
        
        // Initialize the view
        let view = UIView()
        
        // Customize
        view.sizeToFit()
        view.backgroundColor = UIColor.clearColor()
        
        
        // Create an array of the payment types used
        for type in masterPaymentTypes {
            // Check to see if the payment type is there
            if self.paymentTypes.contains(type) {
                typesUsed.append(type)
            }
        }
        
        
        // Add the pretty labels
        for (index, type) in typesUsed.enumerate() {
            // Initialize the label
            let typeLabel = PaymentTypeLabel(text: Vendor.paymentTypeDisplayName(type))

            // Add to the main view
            view.addSubview(typeLabel)
            
            
            switch index {
            case 0:
                // If there's only one row, include bottom constraint
                if typesUsed.count <= 3 {
                    typeLabel.snp_makeConstraints{ (make) -> Void in
                        make.top.equalTo(view.snp_topMargin)
                        make.left.equalTo(view.snp_leftMargin)
                        make.width.equalTo(view.snp_width).multipliedBy(scaleFactor)
                        make.height.equalTo(height)
                        
                        make.bottom.equalTo(view.snp_bottomMargin)
                    }
                    
                }
                    // Otherwise, don't leave out the bottom constraint
                else {
                    typeLabel.snp_makeConstraints{ (make) -> Void in
                        make.top.equalTo(view.snp_topMargin)
                        make.left.equalTo(view.snp_leftMargin)
                        make.width.equalTo(view.snp_width).multipliedBy(scaleFactor)
                        make.height.equalTo(height)
                    }
                }
            case 1:
                typeLabel.snp_makeConstraints{ (make) -> Void in
                    make.top.equalTo(typeLabels[0].snp_top)
                    make.centerX.equalTo(view.snp_centerX)
                    make.width.equalTo(view.snp_width).multipliedBy(scaleFactor)
                    make.height.equalTo(height)
                }
            case 2:
                typeLabel.snp_makeConstraints{ (make) -> Void in
                    make.top.equalTo(typeLabels[0].snp_top)
                    make.right.equalTo(view.snp_rightMargin)
                    make.width.equalTo(view.snp_width).multipliedBy(scaleFactor)
                    make.height.equalTo(height)
                }
            case 3:
                typeLabel.snp_makeConstraints{ (make) -> Void in
                    make.top.equalTo(typeLabels[0].snp_bottom).offset(10.0)
                    make.left.equalTo(view.snp_leftMargin)
                    make.width.equalTo(view.snp_width).multipliedBy(scaleFactor)
                    
                    make.bottom.equalTo(view.snp_bottomMargin)
                    make.height.equalTo(height)
                }
                
            case 4:
                typeLabel.snp_makeConstraints{ (make) -> Void in
                    make.top.equalTo(typeLabels[index-1].snp_top)
                    make.centerX.equalTo(view.snp_centerX)
                    make.width.equalTo(view.snp_width).multipliedBy(scaleFactor)
                    make.height.equalTo(height)
                }
            default:
                print("Too many payment types, not enough constraint conditions")
            }
            
            // Add the label to the label array
            typeLabels.append(typeLabel)
        }
        
        return view
    }

}