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
        self.titleLabel!.font = UIFont(name: "Raleway-Light", size: 28.0)
        self.setTitleColor(MyColors.green(), forState: .Normal)
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        self.contentEdgeInsets = UIEdgeInsetsMake(12, 8, 12, 8)
        self.backgroundColor = nil
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 2
    }
    
}