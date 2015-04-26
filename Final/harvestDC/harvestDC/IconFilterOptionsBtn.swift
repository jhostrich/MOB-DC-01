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
        self.icon.addSubview(image)
        
        // Label
        self.label = MainFilterOptionsBtn(frame: CGRectZero)
        self.label.backgroundColor = MyColors.green()
        self.label.setTitle(title, forState: .Normal)
        
        // Add as subviews
        self.addSubview(self.icon)
        self.addSubview(self.label)
        
        // Image Constraints
        self.image.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self.icon.snp_center)
            make.height.equalTo(self.icon.snp_height).offset(-10)
            make.width.equalTo(self.icon.snp_width).offset(-10)
        }
        
        // Icon Constraints
        self.icon.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_top)
            make.height.equalTo(self.snp_height)
            make.left.equalTo(self.snp_left)
        }
        
        // Label Constraints
        self.label.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_top)
            make.height.equalTo(self.snp_height)
            make.right.equalTo(self.snp_right)
            make.left.equalTo(self.icon.snp_right)
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