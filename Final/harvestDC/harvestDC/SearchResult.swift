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
    private let masterPaymentTypes = ["creditCards", "snap", "seniorFmnp", "wic", "fvrx"]
    
    // Keys are strings Mon, Tues, Wed, Thur, Fri, Sat, Sun
    // Values are (open, close) in military time
    // i.e. {"Mon":[800,1600],"Sat":[1000,1400]}
    var openTimes: [String: (Int, Int)] = [:]
    
    // Keys: “weekdaysAM”, “weekdaysPM”, “weekends”
    var openCategories: [String: Bool] = [:]
    
    func prettyPrintOpenTimes() -> String {
        return "That's a pretty nice schedule you got there"
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
        var view = UIView()
        
        // Customize
        view.sizeToFit()
        view.backgroundColor = UIColor.greenColor()
        
        
        // Create an array of the payment types used
        for type in masterPaymentTypes {
            // Check to see if the payment type is there
            if self.paymentTypes[type] != nil {
                typesUsed.append(type)
            }
        }
        
        
        // Add the pretty labels
        for (index, type) in enumerate(typesUsed) {
            // Initialize the label
            var typeLabel = UILabel()
            typeLabel.text = Vendor.paymentTypeDisplayName(type)
            typeLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
            typeLabel.textAlignment = .Center
            typeLabel.numberOfLines = 0
            typeLabel.layer.borderColor = UIColor.blackColor().CGColor
            typeLabel.layer.borderWidth = 2.0

            // Add to the main view
            view.addSubview(typeLabel)
            
            
            
            switch index {
            case 0:
                // If there's only one row, include bottom constraint
                if typesUsed.count <= 3 {
                    println("Edge case, bitch")
                    typeLabel.snp_makeConstraints({ (make) -> Void in
                        make.top.equalTo(view.snp_topMargin)
                        make.left.equalTo(view.snp_leftMargin)
                        make.width.equalTo(view.snp_width).multipliedBy(scaleFactor)
                        make.height.equalTo(height)
                        
                        make.bottom.equalTo(view.snp_bottomMargin)
                    })
                    
                }
                    // Otherwise, don't leave out the bottom constraint
                else {
                    println("Normal shit")
                    typeLabel.snp_makeConstraints({ (make) -> Void in
                        make.top.equalTo(view.snp_topMargin)
                        make.left.equalTo(view.snp_leftMargin)
                        make.width.equalTo(view.snp_width).multipliedBy(scaleFactor)
                        make.height.equalTo(height)
                    })
                }
            case 1:
                typeLabel.snp_makeConstraints({ (make) -> Void in
                    make.top.equalTo(typeLabels[0].snp_top)
                    make.centerX.equalTo(view.snp_centerX)
                    make.width.equalTo(view.snp_width).multipliedBy(scaleFactor)
                    make.height.equalTo(height)
                })
            case 2:
                typeLabel.snp_makeConstraints({ (make) -> Void in
                    make.top.equalTo(typeLabels[0].snp_top)
                    make.right.equalTo(view.snp_rightMargin)
                    make.width.equalTo(view.snp_width).multipliedBy(scaleFactor)
                    make.height.equalTo(height)
                })
            case 3:
                typeLabel.snp_makeConstraints({ (make) -> Void in
                    make.top.equalTo(typeLabels[0].snp_bottom).with.offset(10.0)
                    make.left.equalTo(view.snp_leftMargin)
                    make.width.equalTo(view.snp_width).multipliedBy(scaleFactor)
                    
                    make.bottom.equalTo(view.snp_bottomMargin)
                    make.height.equalTo(height)
                })
                
            case 4:
                typeLabel.snp_makeConstraints({ (make) -> Void in
                    make.top.equalTo(typeLabels[index-1].snp_top)
                    make.centerX.equalTo(view.snp_centerX)
                    make.width.equalTo(view.snp_width).multipliedBy(scaleFactor)
                    make.height.equalTo(height)
                })
            default:
                println("Too many payment types, not enough constraint conditions")
            }
            
            // Add the label to the label array
            typeLabels.append(typeLabel)
        }
        
        return view
    }

}