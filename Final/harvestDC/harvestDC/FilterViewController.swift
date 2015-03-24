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

    override func viewDidLoad() {
        super.viewDidLoad()

        // ----------------------
        // Initialize Scroll View
        // ----------------------
        
        // Scroll View
        self.scrollView = UIScrollView()
        self.scrollView.backgroundColor = MyColors.lightGrey()
        self.scrollView.delegate = self
        self.view.addSubview(self.scrollView)
        
        // Set constraints
        self.scrollView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp_topMargin).with
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
            make.width.equalTo(self.view.snp_width)
            make.centerX.equalTo(self.view.snp_centerX)
            make.height.greaterThanOrEqualTo(self.scrollView.snp_height)
        }
    
        
        // Test label for content view
        let label = MyInfoLabel(text: "Filter view, bitch", font: "Raleway-Bold", fontSize: 22)
        label.backgroundColor = MyColors.green()
        self.contentView.addSubview(label)
        
        label.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.contentView.snp_topMargin)
            make.left.equalTo(self.contentView.snp_leftMargin)
            make.right.equalTo(self.contentView.snp_rightMargin)
            make.height.equalTo(200)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        // Set the content size of the scroll view based on the height of the content view once it's been drawn
        // subtract 64 because of the navigation bar
        self.scrollView.contentSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: self.contentView.frame.height-64)
    }
}
