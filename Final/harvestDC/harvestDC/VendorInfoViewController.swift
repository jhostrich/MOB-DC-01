//
//  InfoViewController.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/20/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class VendorInfoViewController: UIViewController {
    
    // search result passed in
    var result: Vendor?
    
    // Labels
    var nameLabel: UILabel!
    var generalDescriptionLabel: UILabel!
    var openLabel: UILabel!
    
    var paymentTypesTitleLabel: UILabel!
    var paymentTypesDetailView: UIView!
    var paymentTypesArray: [String] = []
    var paymentTypesLabelArray: [UILabel] = []
    
    var marketScheduleTitleLabel: UILabel!
    var marketScheduleDetailLabel: UILabel!
    
    var productInfoTitleLabel: UILabel!
    var productInfoDetailLabel: UILabel!
    
    var vendorWebsiteTitleLabel: UILabel!
    var vendorWebsiteDetailLabel: UILabel!
    
    var contactInfoTitleLabel: UILabel!
    var contactInfoDetailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        drawVendorInfo()
    }
    
    
    func drawVendorInfo() {
        // Name Label
        self.nameLabel = UILabel()
        self.nameLabel.text = self.result?.name
        self.nameLabel.numberOfLines = 0
        self.nameLabel.sizeToFit()
        self.nameLabel.font = UIFont(name: "Raleway-SemiBold", size: 22.0)
        self.nameLabel.backgroundColor = UIColor.blueColor()
        self.nameLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(self.nameLabel)
        
        // Name Label Constraints
        self.nameLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp_topMargin).with.offset(64)
            make.left.equalTo(self.view.snp_leftMargin)
            make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
        }
        
        
        // General Description Label
        self.generalDescriptionLabel = UILabel()
        self.generalDescriptionLabel.text = self.result?.generalDescription
        self.generalDescriptionLabel.numberOfLines = 0
        self.generalDescriptionLabel.sizeToFit()
        self.generalDescriptionLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        self.generalDescriptionLabel.backgroundColor = UIColor.blueColor()
        self.generalDescriptionLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(self.generalDescriptionLabel!)

        // Address Label Constraints
        self.generalDescriptionLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.nameLabel.snp_bottom)
            make.left.equalTo(self.view.snp_leftMargin)
            make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
        }

        
        // Open Label
        self.openLabel = UILabel()
        self.openLabel.text = ""
        self.openLabel.numberOfLines = 0
        self.openLabel.sizeToFit()
        self.openLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        self.openLabel.backgroundColor = UIColor.blueColor()
        self.openLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(self.openLabel)
        
        // Open Label Constraints
        self.openLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.generalDescriptionLabel.snp_bottom)
            make.left.equalTo(self.view.snp_leftMargin)
            make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
        }
        
        
        // Payment Types Title Label
        self.paymentTypesTitleLabel = UILabel()
        self.paymentTypesTitleLabel.numberOfLines = 0
        self.paymentTypesTitleLabel.sizeToFit()
        self.paymentTypesTitleLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        self.paymentTypesTitleLabel.backgroundColor = UIColor.blueColor()
        self.paymentTypesTitleLabel.textColor = UIColor.whiteColor()
        
        // Only set the title to "Payment Types" if we have payment types
        if self.result?.paymentTypes.count == 0 {
            self.paymentTypesTitleLabel.text = ""
        }
        else {
            self.paymentTypesTitleLabel.text = "Payment Types"
        }
        
        self.view.addSubview(self.paymentTypesTitleLabel)
        
        // Payment Types Title Label Constraints
        self.paymentTypesTitleLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.openLabel.snp_bottom)
            make.left.equalTo(self.view.snp_leftMargin)
            make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
        }
        
        
        // Payment Types Detail View
        self.paymentTypesDetailView = UIView()
        self.paymentTypesDetailView.sizeToFit()
        self.paymentTypesDetailView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(self.paymentTypesDetailView)
        
        // Create an array of the payment types used
        for type in Vendor.masterPaymentTypes() {
            // Check to see if the payment type is there
            if self.result?.paymentTypes[type] != nil {
                self.paymentTypesArray.append(type)
            }
        }
        
        // Constraint constants
        let scaleFactor = 0.25
        let height = 60.0

        
        // Set constraints for UIView
        self.paymentTypesDetailView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.paymentTypesTitleLabel.snp_bottom)
            make.left.equalTo(self.view.snp_leftMargin)
            make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
        }
        
        for (index, type) in enumerate(self.paymentTypesArray) {
            var typeLabel = UILabel()
            typeLabel.text = Vendor.paymentTypeDisplayName(type)
            typeLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
            typeLabel.textAlignment = .Center
            typeLabel.numberOfLines = 0
            typeLabel.layer.borderColor = UIColor.blackColor().CGColor
            typeLabel.layer.borderWidth = 2.0
            
            self.paymentTypesDetailView.addSubview(typeLabel)
            


            switch index {
                case 0:
                    // If there's only one row, include bottom constraint
                    if self.paymentTypesArray.count <= 3 {
                        println("Edge case, bitch")
                        typeLabel.snp_makeConstraints({ (make) -> Void in
                            make.top.equalTo(self.paymentTypesDetailView.snp_topMargin)
                            make.left.equalTo(self.paymentTypesDetailView.snp_leftMargin)
                            make.width.equalTo(self.paymentTypesDetailView.snp_width).multipliedBy(scaleFactor)
                            make.height.equalTo(height)
                            
                            make.bottom.equalTo(self.paymentTypesDetailView.snp_bottomMargin)
                        })

                    }
                    // Otherwise, just to the rest of them
                    else {
                        println("Normal shit")
                        typeLabel.snp_makeConstraints({ (make) -> Void in
                            make.top.equalTo(self.paymentTypesDetailView.snp_topMargin)
                            make.left.equalTo(self.paymentTypesDetailView.snp_leftMargin)
                            make.width.equalTo(self.paymentTypesDetailView.snp_width).multipliedBy(scaleFactor)
                            make.height.equalTo(height)
                        })
                    }
                case 1:
                    typeLabel.snp_makeConstraints({ (make) -> Void in
                        make.top.equalTo(self.paymentTypesLabelArray[0].snp_top)
                        make.centerX.equalTo(self.paymentTypesDetailView.snp_centerX)
                        make.width.equalTo(self.paymentTypesDetailView.snp_width).multipliedBy(scaleFactor)
                        make.height.equalTo(height)
                    })
                case 2:
                    typeLabel.snp_makeConstraints({ (make) -> Void in
                        make.top.equalTo(self.paymentTypesLabelArray[0].snp_top)
                        make.right.equalTo(self.paymentTypesDetailView.snp_rightMargin)
                        make.width.equalTo(self.paymentTypesDetailView.snp_width).multipliedBy(scaleFactor)
                        make.height.equalTo(height)
                    })
                case 3:
                    typeLabel.snp_makeConstraints({ (make) -> Void in
                        make.top.equalTo(self.paymentTypesLabelArray[0].snp_bottom).with.offset(10.0)
                        make.left.equalTo(self.paymentTypesDetailView.snp_leftMargin)
                        make.width.equalTo(self.paymentTypesDetailView.snp_width).multipliedBy(scaleFactor)
                        
                        make.bottom.equalTo(self.paymentTypesDetailView.snp_bottomMargin)
                        make.height.equalTo(height)
                    })

                case 4:
                    typeLabel.snp_makeConstraints({ (make) -> Void in
                        make.top.equalTo(self.paymentTypesLabelArray[index-1].snp_top)
                        make.centerX.equalTo(self.paymentTypesDetailView.snp_centerX)
                        make.width.equalTo(self.paymentTypesDetailView.snp_width).multipliedBy(scaleFactor)
                        make.height.equalTo(height)
                    })
                default:
                    println("Too many payment types, not enough constraint conditions")
            }
            
            // Add the label to the label array
            self.paymentTypesLabelArray.append(typeLabel)
        }
        
        
        // Market Schedule Title Label
        self.marketScheduleTitleLabel = UILabel()
        self.marketScheduleTitleLabel.text = "Market Schedule Info:"
        self.marketScheduleTitleLabel.numberOfLines = 0
        self.marketScheduleTitleLabel.sizeToFit()
        self.marketScheduleTitleLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        self.marketScheduleTitleLabel.backgroundColor = UIColor.blueColor()
        self.marketScheduleTitleLabel.textColor = UIColor.whiteColor()
        
        self.view.addSubview(self.marketScheduleTitleLabel)
        
        // Market Schedule Title Label Constraints
        self.marketScheduleTitleLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.paymentTypesDetailView.snp_bottom)
            make.left.equalTo(self.view.snp_leftMargin)
            make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
        }
        
        
        
        // Market Schedule Detail Label
        self.marketScheduleDetailLabel = UILabel()
        self.marketScheduleDetailLabel.text = self.result?.prettyPrintOpenTimes()
        self.marketScheduleDetailLabel.numberOfLines = 0
        self.marketScheduleDetailLabel.sizeToFit()
        self.marketScheduleDetailLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        self.marketScheduleDetailLabel.backgroundColor = UIColor.blueColor()
        self.marketScheduleDetailLabel.textColor = UIColor.whiteColor()

        self.view.addSubview(self.marketScheduleDetailLabel)
        
        // Market Schedule Title Label Constraints
        self.marketScheduleDetailLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.marketScheduleTitleLabel.snp_bottom)
            make.left.equalTo(self.view.snp_leftMargin)
            make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
        }

        
        // Product Info Title Label
        self.productInfoTitleLabel = UILabel()
        self.productInfoTitleLabel.numberOfLines = 0
        self.productInfoTitleLabel.sizeToFit()
        self.productInfoTitleLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        self.productInfoTitleLabel.backgroundColor = UIColor.blueColor()
        self.productInfoTitleLabel.textColor = UIColor.whiteColor()
        
        if self.result?.productInfo == "" {
            self.productInfoTitleLabel.text = ""
        }
        else {
            self.productInfoTitleLabel.text = "Product Info:"
        }
        
        self.view.addSubview(self.productInfoTitleLabel)
        
        // Product Info Title Label Constraints
        self.productInfoTitleLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.marketScheduleDetailLabel.snp_bottom)
            make.left.equalTo(self.view.snp_leftMargin)
            make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
        }
        
        
        
        // Product Info Detail Label
        self.productInfoDetailLabel = UILabel()
        self.productInfoDetailLabel.numberOfLines = 0
        self.productInfoDetailLabel.text = self.result?.productInfo
        self.productInfoDetailLabel.sizeToFit()
        self.productInfoDetailLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        self.productInfoDetailLabel.backgroundColor = UIColor.blueColor()
        self.productInfoDetailLabel.textColor = UIColor.whiteColor()
        
        self.view.addSubview(self.productInfoDetailLabel)
        
        // Product Info Detail Label Constraints
        self.productInfoDetailLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.productInfoTitleLabel.snp_bottom)
            make.left.equalTo(self.view.snp_leftMargin)
            make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
        }
        
        
        // Vendor Website Title Label
        self.vendorWebsiteTitleLabel = UILabel()
        self.vendorWebsiteTitleLabel = UILabel()
        self.vendorWebsiteTitleLabel.numberOfLines = 0
        self.vendorWebsiteTitleLabel.sizeToFit()
        self.vendorWebsiteTitleLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        self.vendorWebsiteTitleLabel.backgroundColor = UIColor.blueColor()
        self.vendorWebsiteTitleLabel.textColor = UIColor.whiteColor()
        
        if self.result?.productInfo == "" {
            self.productInfoTitleLabel.text = ""
        }
        else {
            self.productInfoTitleLabel.text = "Website:"
        }
        
        self.view.addSubview(self.vendorWebsiteTitleLabel)
        
        // Website Title Label Constraints
        self.vendorWebsiteTitleLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.productInfoDetailLabel.snp_bottom)
            make.left.equalTo(self.view.snp_leftMargin)
            make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
        }

        
        // Website Detail Label
        self.vendorWebsiteDetailLabel = UILabel()
        self.vendorWebsiteDetailLabel.numberOfLines = 0
        self.vendorWebsiteDetailLabel.text = self.result?.website
        self.vendorWebsiteDetailLabel.sizeToFit()
        self.vendorWebsiteDetailLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        self.vendorWebsiteDetailLabel.backgroundColor = UIColor.blueColor()
        self.vendorWebsiteDetailLabel.textColor = UIColor.whiteColor()
        
        self.view.addSubview(self.vendorWebsiteDetailLabel)
        
        // Website Detail Label Constraints
        self.vendorWebsiteDetailLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.vendorWebsiteTitleLabel.snp_bottom)
            make.left.equalTo(self.view.snp_leftMargin)
            make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
        }


//        var contactInfoTitleLabel: UILabel?
//        var contactInfoDetailLabel: UILabel?

        
        // Contact Info Title Label
        self.contactInfoTitleLabel = UILabel()
        self.contactInfoTitleLabel = UILabel()
        self.contactInfoTitleLabel.numberOfLines = 0
        self.contactInfoTitleLabel.sizeToFit()
        self.contactInfoTitleLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        self.contactInfoTitleLabel.backgroundColor = UIColor.blueColor()
        self.contactInfoTitleLabel.textColor = UIColor.whiteColor()
        
        if self.result?.productInfo == "" {
            self.contactInfoTitleLabel.text = ""
        }
        else {
            self.contactInfoTitleLabel.text = "Contact Info:"
        }
        
        self.view.addSubview(self.contactInfoTitleLabel)
        
        // Contact Info Title Label Constraints
        self.contactInfoTitleLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.vendorWebsiteDetailLabel.snp_bottom)
            make.left.equalTo(self.view.snp_leftMargin)
            make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
        }
        
        
        // Website Detail Label
        self.contactInfoDetailLabel = UILabel()
        self.contactInfoDetailLabel.numberOfLines = 0
        self.contactInfoDetailLabel.text = self.result?.contactInfo
        self.contactInfoDetailLabel.sizeToFit()
        self.contactInfoDetailLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        self.contactInfoDetailLabel.backgroundColor = UIColor.blueColor()
        self.contactInfoDetailLabel.textColor = UIColor.whiteColor()
        
        self.view.addSubview(self.contactInfoDetailLabel)
        
        // Website Detail Label Constraints
        self.contactInfoDetailLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.contactInfoTitleLabel.snp_bottom)
            make.left.equalTo(self.view.snp_leftMargin)
            make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
        }

        
    }
}
