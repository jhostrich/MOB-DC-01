//
//  MarketInfoViewController.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/21/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class MarketInfoViewController: UIViewController {

    
    // search result passed in
    var resultOptional: Market?
    
    // Labels
    var nameLabel: UILabel!
    var generalDescriptionLabel: UILabel!
    var openLabel: UILabel!
    
    var nearestMetroTitleText = "Nearest Metro:"
    var nearestMetroTitleLabel: UILabel!
    var nearestMetroDetailLabel: UILabel!
    
    var parkingTitleText = "Parking:"
    var parkingTitleLabel: UILabel!
    var parkingDetailLabel: UILabel!

    var paymentTypesTitleText = "Payment Types"
    var paymentTypesTitleLabel: UILabel!
    var paymentTypesDetailView: UIView!
    
    var websiteTitleText = "Website:"
    var websiteTitleLabel: UILabel!
    var websiteDetailLabel: UILabel!
    
    var contactInfoTitleText = "Contact Info:"
    var contactInfoTitleLabel: UILabel!
    var contactInfoDetailLabel: UILabel!
    
    // TODO: Add Vendor stuff
    
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
            
            // Address Label Constraints
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
            
            
            // -------------------
            // Nearest Metro Label
            // -------------------

            // Nearest Metro Title Label
            if result.nearestMetro == "" { self.nearestMetroTitleText = "" }
            self.nearestMetroTitleLabel = MyInfoLabel(text: self.nearestMetroTitleText, fontSize: 14.0)
            self.view.addSubview(self.nearestMetroTitleLabel)
            
            // Nearest Metro Title Label Constraints
            self.nearestMetroTitleLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.openLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            }
            
            
            // Nearest Metro Label
            self.nearestMetroDetailLabel = MyInfoLabel(text: result.nearestMetro, fontSize: 14.0)
            self.view.addSubview(self.nearestMetroDetailLabel)
            
            // Nearest Metro Label Constraints
            self.nearestMetroDetailLabel.snp_makeConstraints({ (make) -> Void in
                make.top.equalTo(self.nearestMetroTitleLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            })
            

            // -------------
            // Parking Label
            // -------------
            
            // Parking Title Label
            if result.parkingInfo == "" { self.parkingTitleText = "" }
            self.parkingTitleLabel = MyInfoLabel(text: self.parkingTitleText, fontSize: 14.0)
            self.view.addSubview(self.parkingTitleLabel)
            
            // Parking Title Label Constraints
            self.parkingTitleLabel.snp_makeConstraints({ (make) -> Void in
                make.top.equalTo(self.nearestMetroDetailLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            })
            
            
            // Parking Detail Label
            self.parkingDetailLabel = MyInfoLabel(text: result.parkingInfo, fontSize: 14.0)
            self.view.addSubview(self.parkingDetailLabel)
            
            // Parking Detail Label Constraints
            self.parkingDetailLabel.snp_makeConstraints({ (make) -> Void in
                make.top.equalTo(self.parkingTitleLabel.snp_bottom)
                make.left.equalTo(self.view.snp_leftMargin)
                make.width.equalTo(self.view.snp_width).multipliedBy(0.75)
            })
            
            
            // -------------------
            // Payment Types Label
            // -------------------
            
            // Payment Types Title Label
            if result.paymentTypes.count == 0 { self.paymentTypesTitleText = "" }
            self.paymentTypesTitleLabel = MyInfoLabel(text: self.paymentTypesTitleText, fontSize: 14.0)
            self.view.addSubview(self.paymentTypesTitleLabel)
            
            // Payment Types Title Label Constraints
            self.paymentTypesTitleLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.parkingDetailLabel.snp_bottom)
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
            
            
            // -------------
            // Website Label
            // -------------
            
            // Vendor Website Title Label
            if result.website == "" { self.websiteTitleText = "" }
            self.websiteTitleLabel = MyInfoLabel(text: self.websiteTitleText, fontSize: 14.0)
            self.view.addSubview(self.websiteTitleLabel)
            
            // Website Title Label Constraints
            self.websiteTitleLabel.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.paymentTypesDetailView.snp_bottom)
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
