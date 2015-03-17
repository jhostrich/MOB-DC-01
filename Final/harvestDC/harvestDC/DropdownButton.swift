//
//  DropdownButton.swift
//  harvestDC
//
//  Created by Johanna Ostrich on 3/15/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

/*----------------------------------
    Sets the styling for dropdown selectors on Sentence Search screen
----------------------------------*/

class DropdownButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        self.titleLabel!.font = UIFont(name: "Raleway-SemiBold", size: 34.0)
        self.backgroundColor = UIColor.whiteColor()
        self.setTitleColor(UIColor(red: 64/255, green: 156/255, blue: 73/255, alpha: 1.0), forState: .Normal)
        self.titleLabel?.textAlignment = NSTextAlignment.Left
    }
    
    
    
    
    
    
}