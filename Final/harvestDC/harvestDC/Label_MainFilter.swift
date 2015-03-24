// ------------------------------------------------
// Sets the styling for labels on main filter modal
// ------------------------------------------------

import UIKit

class Label_MainFilter : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        self.font = UIFont(name: "Raleway-Light", size: 28.0)
        self.textColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)
        self.numberOfLines = 0
    }
    
}
