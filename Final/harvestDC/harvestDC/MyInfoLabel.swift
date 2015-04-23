//
//  MyInfoLabel.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/21/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class MyInfoLabel: UILabel {

    init(text: String, font: String, fontSize: CGFloat) {
        super.init(frame: CGRectZero)
        
        // Set the label text
        self.attributedText = MyAttributedString.stringWithLineSpacing(text, lineSpacing: 1.0)
        
        // Size the label based on the contents
        self.numberOfLines = 0
        self.sizeToFit()
        
        // Set the font
        self.font = UIFont(name: font, size: fontSize)
        
        // Colors
        self.backgroundColor = UIColor.clearColor()
        self.textColor = MyColors.darkGrey()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
