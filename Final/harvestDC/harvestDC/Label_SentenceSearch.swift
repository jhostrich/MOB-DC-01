// -----------------------------------------------------
// Sets the styling for labels on Sentence Search screen
// -----------------------------------------------------

import UIKit

class Label_SentenceSearch : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // sets font to Raleway Light, 34pt; multi-line
    func setup() {
        self.font = UIFont(name: "Raleway-Light", size: 34.0)
        self.textColor = MyColors.darkGrey()
        self.numberOfLines = 0
        
    }
    
    
}