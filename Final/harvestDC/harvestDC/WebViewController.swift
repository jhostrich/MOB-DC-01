//
//  WebViewController.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/21/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    // Main web view
    var webView: UIWebView!
    
    // URL passed to view controller
    var urlString: String?
    var httpUrlString: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("Web controller for \(self.urlString)")

        
        // --------
        // Web View
        // --------
        
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
        
        
        
        // ---------
        // Go To URL
        // ---------
        
        if let urlStr = self.urlString {
            // Check for http goodness
            if urlStr.lowercaseString.rangeOfString("http") == nil {
                self.httpUrlString = "http://" + urlStr
            }
            else {
                self.httpUrlString = urlStr
            }

            
            // Call the URL
            if let url = NSURL(string: self.httpUrlString) {
                self.webView.loadRequest(NSURLRequest(URL: url))
            }
        }
    }
}
