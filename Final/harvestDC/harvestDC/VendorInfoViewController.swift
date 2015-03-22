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
    
    var marketScheduleTitleText = "Market Schedule Info:"
    var marketSchedule: String!
    var marketScheduleTitleLabel: UILabel!
    var marketScheduleDetailLabel: UILabel!
    
    var productInfoTitleText = "Product Info:"
    var productInfoTitleLabel: UILabel!
    var productInfoDetailLabel: UILabel!
    
    var websiteTitleText = "Website:"
    var websiteTitleLabel: UILabel!
    var websiteDetailLabel: UILabel!
    
    var contactInfoTitleText = "ContactInfo:"
    var contactInfoTitleLabel: UILabel!
    var contactInfoDetailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()

        // Draw all of the vendor info
        drawVendorInfo()
    }
    
    
    func drawVendorInfo() {
        
        // Unwrap that ish
        if let result = self.resultOptional {
            
            // ----------
            // Name Label
            // ----------
            
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
            
            
            // -------------------------
            // General Description Label
            // -------------------------
            
            // General Description Label
            self.generalDescriptionLabel = MyInfoLabel(text: result.generalDescription, fontSize: 14.0)
            self.view.addSubview(self.generalDescriptionLabel!)

            // General Label Constraints
            self.generalDescriptionLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.nameLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            }
            
            
            // ----------
            // Open Label
            // ----------
            
            // Open Label
            self.openLabel = MyInfoLabel(text: "", fontSize: 14.0)
            self.view.addSubview(self.openLabel)
            
            // Open Label Constraints
            self.openLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.generalDescriptionLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            }
            
            
            // --------------------
            // Payment Types Labels
            // --------------------
            
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
            
            
            // ---------------------
            // Market Schedule Label
            // ---------------------
            
            // Market Schedule
            self.marketSchedule = result.prettyPrintOpenTimes()
            
            // Market Schedule Title Label
            if self.marketSchedule == "" { self.marketScheduleTitleText = "" }
            self.marketScheduleTitleLabel = MyInfoLabel(text: self.marketScheduleTitleText, fontSize: 14.0)
            self.view.addSubview(self.marketScheduleTitleLabel)
            
            // Market Schedule Title Label Constraints
            self.marketScheduleTitleLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.paymentTypesDetailView.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            }
            
            // Market Schedule Detail Label
            self.marketScheduleDetailLabel = MyInfoLabel(text: self.marketSchedule, fontSize: 14.0)
            self.view.addSubview(self.marketScheduleDetailLabel)
            
            // Market Schedule Title Label Constraints
            self.marketScheduleDetailLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.marketScheduleTitleLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            }
            
            
            // ------------------
            // Product Info Label
            // ------------------
            
            // Product Info Title Label
            if result.productInfo == "" { self.productInfoTitleText = "" }
            self.productInfoTitleLabel = MyInfoLabel(text: self.productInfoTitleText, fontSize: 14.0)
            self.view.addSubview(self.productInfoTitleLabel)
            
            // Product Info Title Label Constraints
            self.productInfoTitleLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.marketScheduleDetailLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            }
            
            
            // Product Info Detail Label
            self.productInfoDetailLabel = MyInfoLabel(text: result.productInfo, fontSize: 14.0)
            self.view.addSubview(self.productInfoDetailLabel)
            
            // Product Info Detail Label Constraints
            self.productInfoDetailLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.productInfoTitleLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            }
            
            
            // -------------------
            // Website Title Label
            // -------------------
            
            // Vendor Website Title Label
            if result.website == "" { self.websiteTitleText = "" }
            self.websiteTitleLabel = MyInfoLabel(text: self.websiteTitleText, fontSize: 14.0)
            self.view.addSubview(self.websiteTitleLabel)
            
            // Website Title Label Constraints
            self.websiteTitleLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.productInfoDetailLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            }

            
            // Website Detail Label
            self.websiteDetailLabel = MyInfoLabel(text: result.website, fontSize: 14.0)
            self.view.addSubview(self.websiteDetailLabel)
            
            // Website Detail Label Constraints
            self.websiteDetailLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.websiteTitleLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            }
            
            
            // ------------------
            // Contact Info Label
            // ------------------
            
            // Contact Info Title Label
            if result.contactInfo == "" { self.contactInfoTitleText = "" }
            self.contactInfoTitleLabel = MyInfoLabel(text: self.contactInfoTitleText, fontSize: 14.0)
            self.view.addSubview(self.contactInfoTitleLabel)
            
            // Contact Info Title Label Constraints
            self.contactInfoTitleLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.websiteDetailLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            }
            
            // Contact Detail Label
            self.contactInfoDetailLabel = MyInfoLabel(text: result.contactInfo, fontSize: 14.0)
            self.view.addSubview(self.contactInfoDetailLabel)
            
            // Contact Detail Label Constraints
            self.contactInfoDetailLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.contactInfoTitleLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            }
        }
            
    }

}
