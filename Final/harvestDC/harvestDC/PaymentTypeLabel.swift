//
//  Paymentself.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/22/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class PaymentTypeLabel: UILabel {
    
    init(text: String) {
        super.init()
        self.text = text
        self.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        self.textAlignment = .Center
        self.numberOfLines = 0
        self.backgroundColor = MyColors.lightGrey()
        self.layer.borderColor = MyColors.darkGrey().CGColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 5
        
        // Add a pretty sweet shadow
                    self.layer.shadowColor = MyColors.mediumGrey().CGColor
                    self.layer.shadowOffset = CGSizeMake(2, 1)
                    self.layer.shadowRadius = 2
                    self.layer.shadowOpacity = 2
    }
    
    // Required nonsense
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    // More required nonsense
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Add some insets so the words don't overlap with the border
    override func drawTextInRect(rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        return super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }
}
