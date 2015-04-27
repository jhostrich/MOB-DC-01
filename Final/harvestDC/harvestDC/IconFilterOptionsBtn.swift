// -------------------------------------------------
// Sets the styling for buttons on main filter modal
// -------------------------------------------------

import UIKit

class IconFilterOptionsBtn : UIButton {
    
    var icon: MainFilterOptionsBtn!
    var label: MainFilterOptionsBtn!
    
    var image: UIImageView!
    
    init(title: String, icon: String) {
        super.init(frame: CGRectZero)
        self.setup(title, icon: icon)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(title: String, icon: String) {
        // Icon
        self.icon = MainFilterOptionsBtn(frame: CGRectZero)
        let origImage = UIImage(named: icon)
        // Scale to 1/1.5 (2/3) the original size
        let scaledImage = UIImage(CGImage: origImage?.CGImage, scale: origImage!.scale * 1.5, orientation: origImage!.imageOrientation)
        self.image = UIImageView(image: scaledImage)
//        self.image.frame.origin = CGPoint(x: 5, y: 5)
        self.icon.addSubview(image)
        
        // Label
        self.label = MainFilterOptionsBtn(frame: CGRectZero)
//        self.label.backgroundColor = MyColors.green()
        self.label.setTitle(title, forState: .Normal)
        self.label.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.label.contentEdgeInsets = UIEdgeInsetsMake(10, 0, 10, 15)
        
        // Add as subviews
        self.addSubview(self.icon)
        self.addSubview(self.label)
        
        self.image.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self.icon.snp_center)
        }
        
        // Icon Constraints
        self.icon.snp_makeConstraints { (make) -> Void in
            // Relative to image
            make.height.equalTo(60)
            make.width.equalTo(70)
            
            // Relative to outer view
            make.left.equalTo(self.snp_left).priority(1000)
            make.top.equalTo(self.snp_top)
            make.bottom.equalTo(self.snp_bottom)
        }
        
        // Label Constraints
        self.label.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.icon.snp_top)
            make.bottom.equalTo(self.icon.snp_bottom)
            make.right.equalTo(self.snp_right)
            make.left.equalTo(self.icon.snp_right)
        }
        
        // View Constraints
        self.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.icon.snp_top)
            make.bottom.equalTo(self.icon.snp_bottom)
        }
    }
    
    // Style for deselected buttons
    func deselectBtnStyle() {
        self.icon.deselectBtnStyle()
        self.label.deselectBtnStyle()
    }
    
    // Style for selected buttons
    func selectBtnStyle() {
        self.icon.selectBtnStyle()
        self.label.selectBtnStyle()
    }
    
}