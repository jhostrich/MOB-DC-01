//
//  WebViewController.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/21/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    // Title Label
    var titleLabel: UILabel!
    
    // Main web view
    var webView: UIWebView!
    
    // URL passed to view controller
    var urlString: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make the navigation controller title sexier
        self.sexifyNavTitle()
        
        // Draw the web view
        self.drawWebView()
     
        // Navigate to URL
        if let urlStr = urlString {
            self.navigateToUrl(urlStr)
        }
        
    }
    
    
    // ---------------------------
    // Make the Title Label Sexier
    // ---------------------------
    
    func sexifyNavTitle() {
        self.titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 160, height: 40))
        self.titleLabel.text = self.navigationItem.title
        self.titleLabel.font = UIFont(name: "Raleway-SemiBold", size: 16.0)
        self.titleLabel.textColor = MyColors.darkGrey()
        self.titleLabel.backgroundColor = UIColor.clearColor()
        self.titleLabel.adjustsFontSizeToFitWidth = true
        self.titleLabel.minimumScaleFactor = 0.5
        self.titleLabel.numberOfLines = 0
        self.titleLabel.textAlignment = NSTextAlignment.Center
        self.navigationItem.titleView = self.titleLabel
    }
    
    
    // -------------
    // Draw Web View
    // -------------
    
    func drawWebView() {
        
        // Initialize
        self.webView = UIWebView()
        self.view.addSubview(self.webView)
        
        // Constraints
        self.webView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp_topMargin)
            make.left.equalTo(self.view.snp_left)
            make.right.equalTo(self.view.snp_right)
            make.bottom.equalTo(self.view.snp_bottomMargin)
        }
    }
    
    
    // ---------------
    // Navigate to URL
    // ---------------
    
    func navigateToUrl(urlString: String) {
        // HTTP URL String
        var httpUrlString: String
        
        // Check for http goodness
        if urlString.lowercaseString.rangeOfString("http") == nil {
            httpUrlString = "http://" + urlString
        }
        else {
            httpUrlString = urlString
        }
        
        
        // Call the URL
        if let url = NSURL(string: httpUrlString) {
            self.webView.loadRequest(NSURLRequest(URL: url))
        }
    }
}
