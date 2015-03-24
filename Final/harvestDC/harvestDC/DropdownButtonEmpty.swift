// -----------------------------------------------------------------
// Sets the styling for empty dropdown selectors on Sentence Search screen
// -----------------------------------------------------------------

import UIKit

class DropdownButtonEmpty : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // sets empty box style
    func setup() {
        self.titleLabel!.font = UIFont(name: "Raleway", size: 34.0)
        self.setTitleColor(UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1.0), forState: .Normal)
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        self.contentEdgeInsets = UIEdgeInsetsMake(5, 8, 5, 8)
        self.backgroundColor = nil
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 2
    }
    
}