import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var head: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ----- BODY ------------------------------
        var body = UIView()
        body.backgroundColor = UIColor.darkGrayColor()
        
        // need to add subview before adding constraints
        self.view.addSubview(body)
        
        // the default is to use autoresizing (springs and struts), so have to turn it off
        body.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Body width -
        let bodyWidth = NSLayoutConstraint(
            item: body,
            attribute: NSLayoutAttribute.Width,
            // could have just done attribute: .width, but with so many properties, it's easier to read with attribute: NSLayoutAttribute.width

            relatedBy: NSLayoutRelation.Equal,
            // this will usually be equal--it's the same attribute in storyboard
            
            // if you set a static attribute, the toItem is set to nil
            // self.view is want it to not be static but not relate to anything else
            toItem: self.head,
            attribute: NSLayoutAttribute.Width,
            multiplier: 0.5,
            constant: 0.0)
        
        // - Body Vertical Position -
        let bodyVerticalPosition = NSLayoutConstraint(
            item: body,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 0.0)

        // - Body Horizontal Position -
        let bodyHorizontalPosition = NSLayoutConstraint(
            item: body,
            attribute: NSLayoutAttribute.Leading,
            // could also put Left here--same thing
            
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: self.head.frame.width/4
            // or could make it "constant: 22.5", because head width is constant
            // could also have aligned it horizontally too--for this scenario, it's the same
                // but this way, the head and body are connected, which can be helpful in other scenarios
        )

        // - Body Height -
//        let bodyHeight = NSLayoutConstraint(
//            item: body,
//            attribute: NSLayoutAttribute.Height,
//            relatedBy: NSLayoutRelation.Equal,
//            toItem: self.head,
//            attribute: NSLayoutAttribute.Height,
//            multiplier: 2,
//            constant: 0)
        
        // we set this initially to test, but once we defined legs, we redefined body height below
        
        
        

        // constraints are objects
        // and they're on same level as object they affect--so body and bodyVerticalPosition are on same level, are sister objects
        
        self.view.addConstraints([bodyWidth, bodyVerticalPosition, bodyHorizontalPosition])
        // if just adding 1 constraint, can do self.view.addConstraint()
        
        // note: width and height of head are available on viewDidLoad, but not x and y position
        
        
        
        // ----- LEFT ARM ------------------------------
        var leftArm = UIView()
        leftArm.backgroundColor = UIColor.grayColor()
        self.view.addSubview(leftArm)
        
        leftArm.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Left Arm Height -
        let leftArmHeight = NSLayoutConstraint(
            item: leftArm,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 30)

        // - Left Arm Vertical Position -
        let leftArmVerticalPosition = NSLayoutConstraint(
            item: leftArm,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 0.0)
        
        // leftArmHeight.priority = ______
        
        
        // - Left Arm Leading -
        let leftArmLeading = NSLayoutConstraint(
            item: leftArm,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 20.0)

        // - Left Arm Trailing -
        let leftArmTrailing = NSLayoutConstraint(
            item: leftArm,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1.0,
            constant: 0.0)

        self.view.addConstraints([leftArmHeight, leftArmVerticalPosition, leftArmLeading, leftArmTrailing])
        
        
        
        // ----- RIGHT ARM ------------------------------
        var rightArm = UIView()
        rightArm.backgroundColor = leftArm.backgroundColor
        self.view.addSubview(rightArm)
        rightArm.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Right Arm Height -
        let rightArmHeight = NSLayoutConstraint(
            item: rightArm,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: leftArm,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 0)
        
        // - Right Arm Vertical Position -
        let rightArmVerticalPosition = NSLayoutConstraint(
            item: rightArm,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: leftArm,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: 0.0)

        // - Right Arm Leading -
        let rightArmLeading = NSLayoutConstraint(
            item: rightArm,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1.0,
            constant: 0.0)
        
        // - Right Arm Trailing -
        let rightArmTrailing = NSLayoutConstraint(
            item: rightArm,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: -20.0)

        self.view.addConstraints([rightArmHeight, rightArmVerticalPosition, rightArmLeading, rightArmTrailing])
        

        // ----- LEFT LEG ------------------------------
        var leftLeg = UIView()
        leftLeg.backgroundColor = leftArm.backgroundColor
        self.view.addSubview(leftLeg)
        
        leftLeg.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Left Leg Height -
        let leftLegHeight = NSLayoutConstraint(
            item: leftLeg,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 120)

        // - Left Leg Width -
        let leftLegWidth = NSLayoutConstraint(
            item: leftLeg,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 0)
        
        // - Left Leg Bottom -
        let leftLegBottom = NSLayoutConstraint(
            item: leftLeg,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0)

        // - Left Leg Trailing -
        let leftLegTrailing = NSLayoutConstraint(
            item: leftLeg,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1,
            constant: 0)
        
        self.view.addConstraints([leftLegHeight, leftLegWidth, leftLegBottom, leftLegTrailing])
        
        
        
        // ----- RIGHT LEG ------------------------------
        var rightLeg = UIView()
        rightLeg.backgroundColor = leftArm.backgroundColor
        self.view.addSubview(rightLeg)
        
        rightLeg.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Right Leg Height -
        let rightLegHeight = NSLayoutConstraint(
            item: rightLeg,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 120)
        
        // - Right Leg Width -
        let rightLegWidth = NSLayoutConstraint(
            item: rightLeg,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 0)
        
        // - Right Leg Bottom -
        let rightLegBottom = NSLayoutConstraint(
            item: rightLeg,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0)
        
        // - Right Leg Trailing -
        let rightLegTrailing = NSLayoutConstraint(
            item: rightLeg,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1,
            constant: 0)
        
        self.view.addConstraints([rightLegHeight, rightLegWidth, rightLegBottom, rightLegTrailing])
        
        
        // we're going to override the body height we had before--chicken and egg problem before where the body couldn't reference the legs until they were created
        let bodyBottomPosition = NSLayoutConstraint(
            item: body,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: leftLeg,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: 30)
        
        self.view.addConstraint(bodyBottomPosition)
        // actually, not good practice to just override--we're now going to delete the height we set up for body before
    
    }

    
    // it's really better to do autolayout in code--much better when collaborating, easier to find out what's happening if go back to
    // storyboard can give crazy merge conflicts
    
    // if we take the body parts out into functions--when we'd reference the body part anywhere else, we'd need to do self.bodyPart, because it's now a class property

    // if we had a bunch of robots, we'd make Robot class


}
