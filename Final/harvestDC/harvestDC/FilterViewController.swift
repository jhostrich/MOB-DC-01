//
//  FilterViewController.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/22/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UIScrollViewDelegate {
    
    // Scroll View
    var scrollView: UIScrollView!
    var contentView: UIView!
    
    // Products
    var productsTitleLabel: UILabel!
    var productsDetailView: UIView!
    var productsBtnArray: [IconFilterOptionsBtn]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBarItems()
        initScrollView()
    
    
        
        // --------------
        // initProducts()
        // --------------
        
        // Products Title Label
        self.productsTitleLabel = UILabel()
        self.productsTitleLabel.text = "Products"
        self.productsTitleLabel.font = UIFont(name: "Raleway-SemiBold", size: 22)
        self.contentView.addSubview(self.productsTitleLabel)
        
        self.productsTitleLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.contentView.snp_topMargin)
            make.left.equalTo(self.contentView.snp_leftMargin)
            make.right.lessThanOrEqualTo(self.contentView.snp_rightMargin)
        }
        
        // Products Detail View
        self.productsDetailView = UIView()
        self.contentView.addSubview(self.productsDetailView)
        
        self.productsDetailView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.contentView.snp_leftMargin)
            make.right.equalTo(self.contentView.snp_rightMargin)
            make.top.equalTo(self.productsTitleLabel.snp_bottom).offset(5)
        }
        
        // Buttons
        self.productsBtnArray = []
        for (index, product) in enumerate(Vendor.masterProductCategories()) {
            
            // Initialize button
            var button = IconFilterOptionsBtn(title: product, icon: "veggies")
            button.label.titleLabel?.font = UIFont(name: "Raleway-SemiBold", size: 5.0)
            
            self.productsBtnArray.append(button)
            self.productsDetailView.addSubview(button)
            
            // Constraints
            
            // Top row
            if contains([0,1], index) {
                button.snp_makeConstraints({ (make) -> Void in
                    make.top.equalTo(self.productsDetailView.snp_top)
                })
            }
            // All other rows
            else {
                button.snp_makeConstraints({ (make) -> Void in
                    // Note: index - 2 is always in the previous row
                    make.top.equalTo(self.productsBtnArray[index-2].snp_bottom).offset(2)
                })
            }
            
            // First column
            if index % 2 == 0 {
                button.snp_makeConstraints({ (make) -> Void in
                    make.left.equalTo(self.productsDetailView.snp_left)
                })
            }
            // Second Column
            else {
                button.snp_makeConstraints({ (make) -> Void in
                    make.left.equalTo(self.productsBtnArray[index-1].snp_right).offset(2)
                    make.right.equalTo(self.productsDetailView.snp_right)
                })
            }
            
            // Bottom row
            if (index == Vendor.masterProductCategories().count - 1) || ( (Vendor.masterProductCategories().count % 2 == 0) && (index == Vendor.masterProductCategories().count - 2)) {
                button.snp_makeConstraints({ (make) -> Void in
                    make.bottom.equalTo(self.productsDetailView.snp_bottom)
                })
            }
            
            // All button widths
            button.snp_makeConstraints({ (make) -> Void in
                make.width.equalTo(self.productsDetailView.snp_width).multipliedBy(0.5).offset(-1)
            })
        }
        
        
        let things = IconFilterOptionsBtn(title: "Button", icon: "veggies")
        self.contentView.addSubview(things)
        
        things.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.productsDetailView.snp_bottom).offset(20)
            make.left.equalTo(self.contentView.snp_leftMargin)
            make.right.equalTo(self.contentView.snp_rightMargin)
//            make.height.equalTo(200)
        }


    }
    
    override func viewDidAppear(animated: Bool) {
        // Set the content size of the scroll view based on the height of the content view once it's been drawn
        // subtract 64 because of the navigation bar
        self.scrollView.contentSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: self.contentView.frame.height-64)
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
        
        // Test label for content view
        /*
        let label = MyInfoLabel(text: "Filter view", font: "Raleway-Bold", fontSize: 22)
        label.backgroundColor = MyColors.green()
        self.contentView.addSubview(label)
        
        label.snp_makeConstraints { (make) -> Void in
        make.top.equalTo(self.contentView.snp_topMargin)
        make.left.equalTo(self.contentView.snp_leftMargin)
        make.right.equalTo(self.contentView.snp_rightMargin)
        make.height.equalTo(200)
        }
        */

    }

    
    // -------------
    // NAV BAR ITEMS
    // -------------
    // Set up nav bar items
    func setNavBarItems() {
        let cancelButton = FancyBarButton(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "dismiss")
        let doneButton = FancyBarButton(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "done")
        
        self.navigationItem.setLeftBarButtonItem(cancelButton, animated: true)
        self.navigationItem.setRightBarButtonItem(doneButton, animated: true)
    }
    
    
    // --------------------
    // Bar Button Functions
    // --------------------
    
    // Dismissing VC--through navBarItems
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Passing new times back to Sentence Search VC--through Done navBarItem
    func done() {
        // TODO: Pass filter info back to view controller
        dismiss()
    }

}
