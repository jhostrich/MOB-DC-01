//
//  MyInfoLabel.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/21/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class MyInfoLabel: UILabel {

    init(text: String, fontSize: CGFloat) {
        super.init()
        
        // Set the label text
        self.text = text
        
        // Size the label based on the contents
        self.numberOfLines = 0
        self.sizeToFit()
        
        // Set the font
        self.font = UIFont(name: "Raleway-SemiBold", size: fontSize)
        
        // Colors
        self.backgroundColor = UIColor.blueColor()
        self.textColor = UIColor.whiteColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
