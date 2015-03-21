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
    var resultOptional: Vendor?
    
    // Labels
    var nameLabel: UILabel!
    var generalDescriptionLabel: UILabel!
    var openLabel: UILabel!
    
    var paymentTypesTitleText = "Payment Types:"
    var paymentTypesTitleLabel: UILabel!
    var paymentTypesDetailView: UIView!
    var paymentTypesArray: [String] = []
    var paymentTypesLabelArray: [UILabel] = []
    
    var marketScheduleTitleText = "Market Schedule Info:"
    var marketScheduleTitleLabel: UILabel!
    var marketScheduleDetailLabel: UILabel!
    
    var productInfoTitleText = "Product Info:"
    var productInfoTitleLabel: UILabel!
    var productInfoDetailLabel: UILabel!
    
    var vendorWebsiteTitleText = "Website:"
    var vendorWebsiteTitleLabel: UILabel!
    var vendorWebsiteDetailLabel: UILabel!
    
    var contectInfoTitletext = "ContactInfo:"
    var contactInfoTitleLabel: UILabel!
    var contactInfoDetailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()

        // Draw all of the vendor info
        drawVendorInfo()
    }
    
    
    func drawVendorInfo() {
        if let result = self.resultOptional {
            // Name Label
            self.nameLabel = MyInfoLabel(text: result.name, fontSize: 22.0)
                UILabel()
            self.view.addSubview(self.nameLabel)
            
            // Name Label Constraints
            self.nameLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.view.snp_topMargin).with.offset(64)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            }
            
            
            // General Description Label
            self.generalDescriptionLabel = MyInfoLabel(text: result.generalDescription, fontSize: 14.0)
            self.view.addSubview(self.generalDescriptionLabel!)

            // Address Label Constraints
            self.generalDescriptionLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.nameLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            }

            
            // Open Label
            self.openLabel = MyInfoLabel(text: "", fontSize: 14.0)
            self.view.addSubview(self.openLabel)
            
            // Open Label Constraints
            self.openLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.generalDescriptionLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            }
            
            
            // Payment Types Title Label
            if result.paymentTypes.count == 0 { self.paymentTypesTitleText = "" }
            self.paymentTypesTitleLabel = MyInfoLabel(text: self.paymentTypesTitleText, fontSize: 14.0)
            self.view.addSubview(self.paymentTypesTitleLabel)
            
            // Payment Types Title Label Constraints
            self.paymentTypesTitleLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.openLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            }
            
            
            
            // Payment Types Detail View
            self.paymentTypesDetailView = result.paymentTypesDrawDetailView()
            self.view.addSubview(self.paymentTypesDetailView)
            
            // Set constraints for UIView
            self.paymentTypesDetailView.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.paymentTypesTitleLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
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
            self.marketScheduleDetailLabel.text = result.prettyPrintOpenTimes()
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
            
            if result.productInfo == "" {
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
            self.productInfoDetailLabel.text = result.productInfo
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
            
            if result.productInfo == "" {
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
            self.vendorWebsiteDetailLabel.text = result.website
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
            
            if result.productInfo == "" {
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
            self.contactInfoDetailLabel.text = result.contactInfo
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
    
    
    
}
