// -----------------------------------------------------------------
// Sets the styling for dropdown selectors on Sentence Search screen
// -----------------------------------------------------------------

import UIKit

class DropdownButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // sets font to Raleway Semibold, 34pt; green text; background color white; justified left
    func setup() {
        self.titleLabel!.font = UIFont(name: "Raleway-SemiBold", size: 34.0)
        self.backgroundColor = UIColor.whiteColor()
        self.setTitleColor(UIColor(red: 64/255, green: 156/255, blue: 73/255, alpha: 1.0), forState: .Normal)
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        self.contentEdgeInsets = UIEdgeInsetsMake(5, 8, 5, 8)        
    }
    
}