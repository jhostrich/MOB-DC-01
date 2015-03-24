// -----------------------------------------------------------------
// Sets the styling for dropdown selectors on Sentence Search screen
// -----------------------------------------------------------------

import UIKit

class FancyBarButton : UIBarButtonItem {
    
    override init() {
        super.init()
        self.setup()
    }
    
    // Have to redefine this init because it needs to access the init() function in this class
    override init(title: String?, style: UIBarButtonItemStyle, target: AnyObject?, action: Selector) {
        super.init(title: title, style: style, target: target, action: action)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        if let font = UIFont(name: "Raleway-SemiBold", size: 17.0) {
            self.setTitleTextAttributes([NSFontAttributeName: font], forState: UIControlState.Normal)
        }
    }
    
}
