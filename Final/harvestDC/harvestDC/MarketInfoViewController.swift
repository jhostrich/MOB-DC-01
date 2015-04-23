//
//  MarketInfoViewController.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/21/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class MarketInfoViewController: UIViewController, UIScrollViewDelegate {
    
    // ------------
    // Declarations
    // ------------
    
    // Scroll View
    // Scroll View
    var scrollView: UIScrollView!
    var contentView: UIView!

    
    // search result passed in
    var resultOptional: Market?
    
    // Name
    var nameLabel: UILabel!
    
    // Address
    var addressLabel: UILabel!
    
    // Open
    var openText: String!
    var openLabel: UILabel!
    var openTimesLabel: UILabel!
    
    // General Description
    var generalDescriptionLabel: UILabel!
    
    // Nearest Metro
    var nearestMetroTitleText = "Nearest Metro(s):"
    var nearestMetroTitleLabel: UILabel!
    var nearestMetroDetailLabel: UILabel!
    
    // Parking
    var parkingTitleText = "Parking:"
    var parkingTitleLabel: UILabel!
    var parkingDetailLabel: UILabel!

    // Payment Types
    var paymentTypesTitleText = "Payment Types:"
    var paymentTypesTitleLabel: UILabel!
    var paymentTypesDetailView: UIView!
    
    // Payment Types Disclaimer
    var paymentTypesDisclaimerText = "*Some vendors may not take all payment types accepted by the market."
    var paymentTypesDisclaimerLabel: UILabel!
    
    // Website
    var websiteTitleText = "Website:"
    var websiteTitleLabel: UILabel!
    var websiteDetailButton: WebsiteButton!
    
    // Contact Info
    var contactInfoTitleText = "Contact Info:"
    var contactInfoTitleLabel: UILabel!
    var contactInfoDetailLabel: UILabel!
    
    
    // -------------
    // View Did Load
    // -------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = MyColors.lightGrey()
        
        // Initialize the scroll view
        self.initScrollView()
        
        // Draw all of the vendor info
        self.drawMarketInfo()
    }
    
    override func viewDidAppear(animated: Bool) {
        // Set the content size of the scroll view based on the height of the content view once it's been drawn
        // subtract 64 because of the navigation bar
        self.scrollView.contentSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: self.contactInfoDetailLabel.frame.maxY - self.nameLabel.frame.minY+30)

        println("Name label frame: \(self.nameLabel.frame)")
    }


    
    // ----------------------
    // Initialize Scroll View
    // ----------------------
    
    func initScrollView() {
        
        // Scroll View
        self.scrollView = UIScrollView()
        self.scrollView.backgroundColor = MyColors.lightGrey()
        self.scrollView.delegate = self
        self.view.addSubview(self.scrollView)
        
        // Set constraints
        self.scrollView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp_topMargin)
            make.left.equalTo(self.view.snp_left)
            make.right.equalTo(self.view.snp_right)
            make.bottom.equalTo(self.view.snp_bottom)
        }
        
        
        // Content View
        self.contentView = UIView()
        self.contentView.backgroundColor = MyColors.lightGrey()
        self.scrollView.addSubview(self.contentView)
        
        // Set Constraints
        self.contentView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.scrollView.snp_top)
            make.left.equalTo(self.view.snp_left)
            make.right.equalTo(self.view.snp_right)
            make.height.greaterThanOrEqualTo(self.scrollView.snp_height)
        }
    }
    
    
    // ----------------
    // Draw Market Info
    // ----------------
    
    func drawMarketInfo() {
        
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
            self.contentView.addSubview(self.nameLabel)
            
            // Name Label Constraints
            self.nameLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.contentView.snp_topMargin)
                make.left.equalTo(self.contentView.snp_leftMargin)
                make.width.equalTo(self.contentView.snp_width).multipliedBy(0.75)
            }
            
            
            // -------------
            // Address Label
            // -------------
            
            // Address Label
            self.addressLabel = MyInfoLabel(text: result.prettyPrintAddress(), font: "Raleway-SemiBold", fontSize: 14.0)
            self.addressLabel.textColor = MyColors.mediumGrey()
            self.contentView.addSubview(self.addressLabel)
            
            // Address Label Constraints
            self.addressLabel.snp_makeConstraints({ (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = self.addressLabel.text != "" ? sectionOffset : 0
println("Address offset \(offset)")
                make.top.equalTo(self.nameLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.contentView.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.nameLabel.snp_right)
            })
            
            
            // ----------
            // Open Label
            // ----------
            
            // Open Label
            self.openLabel = MyInfoLabel(text: result.openText(), font: "Raleway-Bold", fontSize: 14.0)
            
            // Change the text color of openLabel based on if it's open
            self.openLabel.textColor = result.isOpen() ? MyColors.green() : MyColors.red()
            
            // Add to superview
            self.contentView.addSubview(self.openLabel)
            
            // Open Label Constraints
            self.openLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.addressLabel.snp_bottom).offset(sectionOffset)
                make.left.equalTo(self.contentView.snp_leftMargin)
            }
            
            
            // ----------------
            // Open Times Label
            // ----------------
            
            // Open Times Label
            self.openTimesLabel = MyInfoLabel(text: result.prettyPrintOpenTimes(), font: "Raleway-SemiBold", fontSize: 14.0)
            self.contentView.addSubview(self.openTimesLabel)
            
            // Open Label Constraints
            self.openTimesLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.openLabel.snp_top)
                make.left.equalTo(self.openLabel.snp_right)
                make.right.equalTo(self.addressLabel.snp_right)
            }
            
            // -------------------------
            // General Description Label
            // -------------------------
            
            // General Description Label
            self.generalDescriptionLabel = MyInfoLabel(text: result.generalDescription, font: "Raleway-SemiBold", fontSize: 16.0)
            self.contentView.addSubview(self.generalDescriptionLabel!)
            
            // Address Label Constraints
            self.generalDescriptionLabel.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.generalDescription != "" ? sectionOffset : 0
                
                make.top.equalTo(self.openTimesLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.contentView.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.contentView.snp_rightMargin)
            }

            
            // -------------------
            // Nearest Metro Label
            // -------------------

            // Nearest Metro Title Label
            if result.nearestMetro == "" { self.nearestMetroTitleText = "" }
            self.nearestMetroTitleLabel = MyInfoLabel(text: self.nearestMetroTitleText, font: "Raleway-SemiBold", fontSize: 16.0)
            self.nearestMetroTitleLabel.textColor = MyColors.mediumGrey()
            self.contentView.addSubview(self.nearestMetroTitleLabel)
            
            // Nearest Metro Title Label Constraints
            self.nearestMetroTitleLabel.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.nearestMetro != "" ? sectionOffset : 0
                
                make.top.equalTo(self.generalDescriptionLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.contentView.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.contentView.snp_rightMargin)
            }
            
            
            // Nearest Metro Label
            self.nearestMetroDetailLabel = MyInfoLabel(text: result.nearestMetro, font: "Raleway-SemiBold", fontSize: 16.0)
            self.contentView.addSubview(self.nearestMetroDetailLabel)
            
            // Nearest Metro Label Constraints
            self.nearestMetroDetailLabel.snp_makeConstraints({ (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.nearestMetro != "" ? labelOffset : 0

                make.top.equalTo(self.nearestMetroTitleLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.contentView.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.contentView.snp_rightMargin)
            })
            

            // -------------
            // Parking Label
            // -------------
            
            // Parking Title Label
            if result.parkingInfo == "" { self.parkingTitleText = "" }
            self.parkingTitleLabel = MyInfoLabel(text: self.parkingTitleText, font: "Raleway-SemiBold", fontSize: 16.0)
            self.parkingTitleLabel.textColor = MyColors.mediumGrey()
            self.contentView.addSubview(self.parkingTitleLabel)
            
            // Parking Title Label Constraints
            self.parkingTitleLabel.snp_makeConstraints({ (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.parkingInfo != "" ? sectionOffset : 0

                make.top.equalTo(self.nearestMetroDetailLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.contentView.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.contentView.snp_rightMargin)
            })
            
            
            // Parking Detail Label
            self.parkingDetailLabel = MyInfoLabel(text: result.parkingInfo, font: "Raleway-SemiBold", fontSize: 16.0)
            self.parkingDetailLabel.numberOfLines = 2
            self.contentView.addSubview(self.parkingDetailLabel)
            
            // Parking Detail Label Constraints
            self.parkingDetailLabel.snp_makeConstraints({ (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.parkingInfo != "" ? labelOffset : 0

                make.top.equalTo(self.parkingTitleLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.contentView.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.contentView.snp_rightMargin)
            })
            
            
            // -------------------
            // Payment Types Label
            // -------------------
            
            // Payment Types Title Label
            if result.paymentTypes.count == 0 { self.paymentTypesTitleText = "" }
            self.paymentTypesTitleLabel = MyInfoLabel(text: self.paymentTypesTitleText, font: "Raleway-SemiBold", fontSize: 16.0)
            self.paymentTypesTitleLabel.textColor = MyColors.mediumGrey()
            self.contentView.addSubview(self.paymentTypesTitleLabel)
            
            // Payment Types Title Label Constraints
            self.paymentTypesTitleLabel.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.paymentTypes.count > 0 ? sectionOffset : 0
println("Offset 1: \(offset)")
                make.top.equalTo(self.parkingDetailLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.contentView.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.contentView.snp_rightMargin)
            }
            
            
            // Payment Types Detail View
            self.paymentTypesDetailView = result.paymentTypesDrawDetailView()
            self.contentView.addSubview(self.paymentTypesDetailView)
            
            // Set constraints for UIView
            self.paymentTypesDetailView.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.paymentTypes.count > 0 ? labelOffset : 0
                println("Offset 2: \(offset)")

                make.top.equalTo(self.paymentTypesTitleLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.contentView.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.contentView.snp_rightMargin)
            }

            
            
            // Payment Types Disclaimer Label
            if result.paymentTypes.count == 0 { self.paymentTypesDisclaimerText = "" }
            self.paymentTypesDisclaimerLabel = MyInfoLabel(text: self.paymentTypesDisclaimerText, font: "Raleway", fontSize: 12.0)
            self.paymentTypesDisclaimerLabel.textColor = MyColors.mediumGrey()
            self.paymentTypesDisclaimerLabel.numberOfLines = 0
            self.contentView.addSubview(self.paymentTypesDisclaimerLabel)
            
            // Payment Types Disclaimer Label Constraints
            self.paymentTypesDisclaimerLabel.snp_makeConstraints({ (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.paymentTypes.count > 0 ? labelOffset : 0
                println("Offset 1: \(offset)")

                make.top.equalTo(self.paymentTypesDetailView.snp_bottom).offset(offset)
                make.left.equalTo(self.contentView.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.contentView.snp_rightMargin)
            })
            
            
            // -------------
            // Website Label
            // -------------
            
            // Vendor Website Title Label
            if result.website == "" { self.websiteTitleText = "" }
            self.websiteTitleLabel = MyInfoLabel(text: self.websiteTitleText, font: "Raleway-SemiBold", fontSize: 16.0)
            self.websiteTitleLabel.textColor = MyColors.mediumGrey()
            self.contentView.addSubview(self.websiteTitleLabel)
            
            // Website Title Label Constraints
            self.websiteTitleLabel.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.website != "" ? sectionOffset : 0

                make.top.equalTo(self.paymentTypesDisclaimerLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.contentView.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.contentView.snp_rightMargin)
            }
            
            
            // Website Detail Button
            self.websiteDetailButton = WebsiteButton(name: result.name, text: result.website, font: "Raleway-SemiBold", fontSize: 16.0, navigationController: self.navigationController)
            self.contentView.addSubview(self.websiteDetailButton)
            
            // Website Detail Button Constraints
            self.websiteDetailButton.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.website != "" ? labelOffset : 0

                make.top.equalTo(self.websiteTitleLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.contentView.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.contentView.snp_rightMargin)
            }
            
            
            // ------------------
            // Contact Info Label
            // ------------------
            
            // Contact Info Title Label
            if result.contactInfo == "" { self.contactInfoTitleText = "" }
            self.contactInfoTitleLabel = MyInfoLabel(text: self.contactInfoTitleText, font: "Raleway-SemiBold", fontSize: 16.0)
            self.contactInfoTitleLabel.textColor = MyColors.mediumGrey()
            self.contentView.addSubview(self.contactInfoTitleLabel)
            
            // Contact Info Title Label Constraints
            self.contactInfoTitleLabel.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.contactInfo != "" ? sectionOffset : 0

                make.top.equalTo(self.websiteDetailButton.snp_bottom).offset(offset)
                make.left.equalTo(self.contentView.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.contentView.snp_rightMargin)
            }
            
            // Contact Detail Label
            self.contactInfoDetailLabel = MyInfoLabel(text: result.contactInfo, font: "Raleway-SemiBold", fontSize: 16.0)
            self.contentView.addSubview(self.contactInfoDetailLabel)
            
            // Contact Detail Label Constraints
            self.contactInfoDetailLabel.snp_makeConstraints { (make) -> Void in
                // Only add the offset if this section is not empty
                let offset = result.contactInfo != "" ? labelOffset : 0

                make.top.equalTo(self.contactInfoTitleLabel.snp_bottom).offset(offset)
                make.left.equalTo(self.contentView.snp_leftMargin)
                make.right.lessThanOrEqualTo(self.contentView.snp_rightMargin)
                // Add some extra space between the bottom of the
                // label and the bottom of the content view
//                make.bottom.equalTo(self.contentView.snp_bottomMargin).offset(-20)
            }

        }
    }
}
