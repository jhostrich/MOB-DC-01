//
//  WebsiteButton.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/21/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import Foundation

class WebsiteButton: UIButton {
    
    // Name and navigation controller used when pushing web view
    var name: String!
    var navigationController: UINavigationController?
    
    init(name: String, text: String, font: String, fontSize: CGFloat, navigationController: UINavigationController?) {
        super.init(frame: CGRectZero)
        
        // Set the name
        self.name = name
        
        // Set title
        self.setTitle(text, forState: .Normal)
        
        // Size the label based on the contents
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.sizeToFit()
        
        // Edge insets
        self.contentEdgeInsets = UIEdgeInsets(top: -2, left: 0, bottom: 0, right: 0)
        
        // Set the font
        self.titleLabel?.font = UIFont(name: font, size: fontSize)
        
        // Colors
        self.backgroundColor = UIColor.clearColor()
        self.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.setTitleColor(MyColors.mediumGrey(), forState: .Highlighted)
        
        // Set button action
        self.addTarget(self, action: "navigateToUrl", forControlEvents: .TouchUpInside)
        
        // Reference navigation controller for navigateToUrl call
        self.navigationController = navigationController
    }
    
    
    // Navigate to URL
    func navigateToUrl() {
        if let nav = self.navigationController {
            // Initialize the view controller
            let vc = WebViewController()
            
            // Set the title and URL
            vc.title = self.name
            vc.urlString = self.titleLabel?.text
                        
            // Push that ish
            nav.pushViewController(vc, animated: true)
        }
    }
    
    // Required to draw the button without everything freaking out
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    // Required nonsense
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}