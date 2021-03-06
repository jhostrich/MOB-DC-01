// -----------------------------------------------------------------
// Sets the styling for dropdown selectors on Sentence Search screen
// These are views with 2 buttons inside--the main label button and a smaller optional cancel button
// -----------------------------------------------------------------

import UIKit

class DropdownButton : UIView {
    
    // -----------------------------------
    // DECLARING 3 INSIDE BUTTON VARIABLES
    // -----------------------------------

    var labelBtnInsideView: UIButton!
    var cancelBtnInsideView: UIButton!
    var moreOptionsArrowView: UIButton!
    
    
    // ----------------
    // A BUNCH OF INITS
    // ----------------
    
    init() {
        super.init(frame: CGRectZero)
        self.setup()
    }
    
    // setting up empty option--if nothing selected in Extra Features section
    init(empty: Bool) {
        super.init(frame: CGRectZero)
        
        if empty {
            self.emptySetup()
        }
        else {
            self.setup()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    // -----------------------------------------
    // DRAWING INSIDE BUTTONS, WHEN HAVE CONTENT
    // -----------------------------------------
    
    func setup() {
        
        // ------------------------------
        // Style for Dropdown button view
        // ------------------------------
        
        self.backgroundColor = UIColor.whiteColor()
        
        
        // -----------------
        // Main label button
        // -----------------
        
        labelBtnInsideView = UIButton()
        self.addSubview(labelBtnInsideView)

        labelBtnInsideView.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.snp_width)
            make.leading.equalTo(self.snp_leading)
            make.top.equalTo(self.snp_top)
            make.height.equalTo(self.snp_height)
        }
        
        // sets style for main label button
        labelBtnInsideView.titleLabel!.font = UIFont(name: "Raleway-SemiBold", size: 32.0)
        labelBtnInsideView.backgroundColor = nil
        labelBtnInsideView.setTitleColor(MyColors.green(), forState: .Normal)
        labelBtnInsideView.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        labelBtnInsideView.contentEdgeInsets = UIEdgeInsetsMake(5, 8, 5, 75)
        
        labelBtnInsideView.titleLabel!.numberOfLines = 1
        labelBtnInsideView.titleLabel!.adjustsFontSizeToFitWidth = true
        

        
        // --------------------------------------------------
        // Default arrow button (when only 1 option selected)
        // --------------------------------------------------
        
        moreOptionsArrowView = UIButton()
        self.addSubview(moreOptionsArrowView)
        
        moreOptionsArrowView.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.snp_width).multipliedBy(0.125)
            make.trailing.equalTo(self.snp_trailing)
            make.height.equalTo(self.snp_height)
            make.top.equalTo(self.snp_top)
        }
        
        // Arrow icon
        
        let arrowIcon = UIImageView(image: UIImage(named: "chevron"))
        self.moreOptionsArrowView.addSubview(arrowIcon)
        
        arrowIcon.snp_makeConstraints { (make) -> () in
            make.centerX.equalTo(self.moreOptionsArrowView.snp_centerX)
            make.centerY.equalTo(self.moreOptionsArrowView.snp_centerY)
        }
        
        moreOptionsArrowView.hidden = false
     
                
        // -------------------------------------------------------
        // Optional cancel button (when multiple options selected)
        // -------------------------------------------------------

        cancelBtnInsideView = UIButton()
        self.addSubview(cancelBtnInsideView)
        
        cancelBtnInsideView.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.snp_width).multipliedBy(0.125)
            make.trailing.equalTo(self.snp_trailing)
            make.height.equalTo(self.snp_height)
            make.top.equalTo(self.snp_top)
        }
        
        // X icon
        
        let cancelIcon = UIImageView(image: UIImage(named: "X"))
        self.cancelBtnInsideView.addSubview(cancelIcon)
        
        cancelIcon.snp_makeConstraints { (make) -> () in
            make.centerX.equalTo(self.cancelBtnInsideView.snp_centerX)
            make.centerY.equalTo(self.cancelBtnInsideView.snp_centerY)
        }
        
        cancelBtnInsideView.hidden = true
    }
    
    
    // -----------------------------------------------
    // DRAWING INSIDE BUTTONS, WHEN NO CONTENT (EMPTY)
    // -----------------------------------------------

    func emptySetup() {
        self.setup()
        
        labelBtnInsideView.titleLabel!.font = UIFont(name: "Raleway-Light", size: 28.0)
        labelBtnInsideView.setTitleColor(MyColors.green(), forState: .Normal)
        labelBtnInsideView.contentEdgeInsets = UIEdgeInsetsMake(12, 8, 12, 8)
        labelBtnInsideView.backgroundColor = nil
        labelBtnInsideView.layer.borderColor = UIColor.whiteColor().CGColor
        labelBtnInsideView.layer.borderWidth = 2
        
        self.backgroundColor = nil
    }

    
}