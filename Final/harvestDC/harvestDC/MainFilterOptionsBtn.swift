// -------------------------------------------------
// Sets the styling for buttons on main filter modal
// -------------------------------------------------

import UIKit

class MainFilterOptionsBtn : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        self.titleLabel!.font = UIFont(name: "Raleway-Light", size: 28.0)
        self.backgroundColor = UIColor.whiteColor()
        self.setTitleColor(UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0), forState: .Normal)
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        self.contentEdgeInsets = UIEdgeInsetsMake(10, 15, 10, 15)
    }
    
    // Style for deselected buttons
    func deselectBtnStyle() {
        self.backgroundColor = UIColor.whiteColor()
        self.setTitleColor(UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0), forState: .Normal)
    }
    
    // Style for selected buttons
    func selectBtnStyle() {
        self.backgroundColor = UIColor(red: 213/255, green: 209/255, blue: 236/255, alpha: 1.0)
        self.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0), forState: .Normal)
    }
    
    
}