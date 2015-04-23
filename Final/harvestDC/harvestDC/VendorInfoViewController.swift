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
    
    // Name
    var nameLabel: UILabel!
    
    // Open
    var openText: String!
    var openLabel: UILabel!
    var openTimesLabel: UILabel!
    
    // General Description
    var generalDescriptionLabel: UILabel!

    // Payment Types
    var paymentTypesTitleText = "Payment Types:"
    var paymentTypesTitleLabel: UILabel!
    var paymentTypesDetailView: UIView!
    
    // Payment Types Disclaimer
    var paymentTypesDisclaimerText = "*Some vendors may not take all payment types accepted by the market."
    var paymentTypesDisclaimerLabel: UILabel!

    // Market Schedule
    var marketScheduleTitleText = "Market Schedule Info:"
    var marketSchedule: String!
    var marketScheduleTitleLabel: UILabel!
    var marketScheduleDetailLabel: UILabel!
    
    // Product Info
    var productInfoTitleText = "Product Info:"
    var productInfoTitleLabel: UILabel!
    var productInfoDetailLabel: UILabel!
    
    // Website
    var websiteTitleText = "Website:"
    var websiteTitleLabel: UILabel!
    var websiteDetailButton: WebsiteButton!
    
    // Contact Info
    var contactInfoTitleText = "ContactInfo:"
    var contactInfoTitleLabel: UILabel!
    var contactInfoDetailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = MyColors.lightGrey()

        // Draw all of the vendor info
        drawVendorInfo()
    }
    
    
    func drawVendorInfo() {
        
        // Unwrap that ish
        if let result = self.resultOptional {
            
            // Space between sections
            let sectionOffset = 20.0
            
            // Space between labels and sections
            let labelOffset = 0.0

            
            // ----------
            // Name Label
            // ----------
            
            // Name Label
            self.nameLabel = MyInfoLabel(text: result.name, font: "Raleway-Bold", fontSize: 22.0)
                UILabel()
            self.view.addSubview(self.nameLabel)
            
            // Name Label Constraints
            self.nameLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.view.snp_topMargin).offset(64+8)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.70)
            }
            
            
            // ----------
            // Open Label
            // ----------
            
            // Open Label
            self.openLabel = MyInfoLabel(text: result.openText(), font: "Raleway-Bold", fontSize: 14.0)
            
            // Change the text color of openLabel based on if it's open
            self.openLabel.textColor = result.isOpen() ? MyColors.green() : MyColors.red()
            
            // Add to superview
            self.view.addSubview(self.openLabel)
            
            // Open Label Constraints
            self.openLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.nameLabel.snp_bottom).offset(sectionOffset)
                make.left.equalTo(self.view.snp_leftMargin)
            }
            
            
            // ----------------
            // Open Times Label
            // ----------------
            
            // Open Times Label
            self.openTimesLabel = MyInfoLabel(text: result.prettyPrintOpenTimes(), font: "Raleway-SemiBold", fontSize: 14.0)
            self.view.addSubview(self.openTimesLabel)
            
            // Open Label Constraints
            self.openTimesLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.openLabel.snp_top)
                make.left.equalTo(self.openLabel.snp_right)
                make.right.equalTo(self.nameLabel.snp_right)
            }
            
            // -------------------------
            // General Description Label
            // -------------------------
            
            // General Description Label
            self.generalDescriptionLabel = MyInfoLabel(text: result.generalDescription, font: "Raleway-SemiBold", fontSize: 16.0)
            self.view.addSubview(self.generalDescriptionLabel!)
            
            // General Description Label Constraints
            self.generalDescriptionLabel.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.generalDescription != "" ? sectionOffset : 0
                
                make.top.equalTo(self.openTimesLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.view.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.view.snp_rightMargin)
            }

            
            // -------------------
            // Payment Types Label
            // -------------------
            
            // Payment Types Title Label
            if result.paymentTypes.count == 0 { self.paymentTypesTitleText = "" }
            self.paymentTypesTitleLabel = MyInfoLabel(text: self.paymentTypesTitleText, font: "Raleway-SemiBold", fontSize: 16.0)
            self.paymentTypesTitleLabel.textColor = MyColors.mediumGrey()
            self.view.addSubview(self.paymentTypesTitleLabel)
            
            // Payment Types Title Label Constraints
            self.paymentTypesTitleLabel.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.paymentTypes.count > 0 ? sectionOffset : 0
                
                make.top.equalTo(self.generalDescriptionLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.view.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.view.snp_rightMargin)
            }
            
            
            // Payment Types Detail View
            self.paymentTypesDetailView = result.paymentTypesDrawDetailView()
            self.view.addSubview(self.paymentTypesDetailView)
            
            // Set constraints for UIView
            self.paymentTypesDetailView.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.paymentTypes.count > 0 ? labelOffset : 0
                
                make.top.equalTo(self.paymentTypesTitleLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.view.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.view.snp_rightMargin)
            }
            
            
            // Payment Types Disclaimer Label
            if result.paymentTypes.count == 0 { self.paymentTypesDisclaimerText = "" }
            self.paymentTypesDisclaimerLabel = MyInfoLabel(text: self.paymentTypesDisclaimerText, font: "Raleway", fontSize: 12.0)
            self.paymentTypesDisclaimerLabel.textColor = MyColors.mediumGrey()
            self.view.addSubview(self.paymentTypesDisclaimerLabel)
            
            // Payment Types Disclaimer Label Constraints
            self.paymentTypesDisclaimerLabel.snp_makeConstraints({ (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.paymentTypes.count > 0 ? labelOffset : 0
                
                make.top.equalTo(self.paymentTypesDetailView.snp_bottom).offset(offset)
                make.left.equalTo(self.view.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.view.snp_rightMargin)
            })
            
            
            // ------------------
            // Product Info Label
            // ------------------
            
            // Product Info Title Label
            if result.productInfo == "" { self.productInfoTitleText = "" }
            self.productInfoTitleLabel = MyInfoLabel(text: self.productInfoTitleText, font: "Raleway-SemiBold", fontSize: 16.0)
            self.productInfoTitleLabel.textColor = MyColors.mediumGrey()
            self.view.addSubview(self.productInfoTitleLabel)
            
            // Product Info Title Label Constraints
            self.productInfoTitleLabel.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.productInfo != "" ? sectionOffset : 0

                make.top.equalTo(self.paymentTypesDisclaimerLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.view.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.view.snp_rightMargin)
            }
            
            
            // Product Info Detail Label
            self.productInfoDetailLabel = MyInfoLabel(text: result.productInfo, font: "Raleway-SemiBold", fontSize: 14.0)
            self.view.addSubview(self.productInfoDetailLabel)
            
            // Product Info Detail Label Constraints
            self.productInfoDetailLabel.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.productInfo != "" ? labelOffset : 0

                make.top.equalTo(self.productInfoTitleLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.view.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.view.snp_rightMargin)
            }
            
            
            // -------------------
            // Website Title Label
            // -------------------
            
            // Vendor Website Title Label
            if result.website == "" { self.websiteTitleText = "" }
            self.websiteTitleLabel = MyInfoLabel(text: self.websiteTitleText, font: "Raleway-SemiBold", fontSize: 16.0)
            self.websiteTitleLabel.textColor = MyColors.mediumGrey()
            self.view.addSubview(self.websiteTitleLabel)
            
            // Website Title Label Constraints
            self.websiteTitleLabel.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.website != "" ? sectionOffset : 0

                make.top.equalTo(self.productInfoDetailLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.view.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.view.snp_rightMargin)
            }

            
            // Website Detail Button
            self.websiteDetailButton = WebsiteButton(name: result.name, text: result.website, font: "Raleway-SemiBold", fontSize: 14.0, navigationController: self.navigationController)
            self.view.addSubview(self.websiteDetailButton)
            
            // Website Detail Label Constraints
            self.websiteDetailButton.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.website != "" ? labelOffset : 0

                make.top.equalTo(self.websiteTitleLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.view.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.view.snp_rightMargin)
            }
            
            
            // ------------------
            // Contact Info Label
            // ------------------
            
            // Contact Info Title Label
            if result.contactInfo == "" { self.contactInfoTitleText = "" }
            self.contactInfoTitleLabel = MyInfoLabel(text: self.contactInfoTitleText, font: "Raleway-SemiBold", fontSize: 14.0)
            self.contactInfoTitleLabel.textColor = MyColors.mediumGrey()
            self.view.addSubview(self.contactInfoTitleLabel)
            
            // Contact Info Title Label Constraints
            self.contactInfoTitleLabel.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.contactInfo != "" ? sectionOffset : 0

                make.top.equalTo(self.websiteDetailButton.snp_bottom).offset(offset)
                make.left.equalTo(self.view.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.view.snp_rightMargin)
            }
            
            // Contact Detail Label
            self.contactInfoDetailLabel = MyInfoLabel(text: result.contactInfo, font: "Raleway-SemiBold", fontSize: 14.0)
            self.view.addSubview(self.contactInfoDetailLabel)
            
            // Contact Detail Label Constraints
            self.contactInfoDetailLabel.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.contactInfo != "" ? labelOffset : 0

                make.top.equalTo(self.contactInfoTitleLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.view.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.view.snp_rightMargin)
            }
        }
            
    }

}
