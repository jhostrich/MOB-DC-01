//
//  SentenceSearchVC.swift
//  harvestDC
//
//  Created by Johanna Ostrich on 3/14/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit
import Snap


class SentenceSearchVC: UIViewController {

    /* -------------------------------------------
        Declaring Variables for Autolayout
    ------------------------------------------- */
    var introPlusLocationLabel = UILabel()
    var whenOpenLabel = UILabel()
    var extraFeaturesLabel = UILabel()
    var locationBtn = DropdownButton(coder: NSCoder)
    var timesBtn = UIButton()
    var extraFeaturesBtn = UIButton()

    @IBOutlet weak var navBar: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drawFirstLabel()
        drawLocationBtn()
        
        
        }
        
        
    
    /* -------------------------------------------
        Draw first label
    ------------------------------------------- */
    func drawFirstLabel() {
        introPlusLocationLabel.text = "I'm looking for a farmers' market \nnear"
        introPlusLocationLabel.font = UIFont(name: "Raleway-Light", size: 34.0)
        introPlusLocationLabel.numberOfLines = 0
        self.view.addSubview(introPlusLocationLabel)
        introPlusLocationLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - First Label Leading -
        let introPlusLocationLabelLeading = NSLayoutConstraint(
            item: introPlusLocationLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 25.0)
        
        // - First Label Trailing -
        let introPlusLocationLabelTrailing = NSLayoutConstraint(
            item: introPlusLocationLabel,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: -25.0)
        
        // - First Label Top -
        let introPlusLocationLabelTop = NSLayoutConstraint(
            item: introPlusLocationLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: 100.0)
        
        self.view.addConstraints([introPlusLocationLabelLeading, introPlusLocationLabelTrailing, introPlusLocationLabelTop])
        
    }
    
    
    /* -------------------------------------------
        Draw Location Button
    ------------------------------------------- */
    func drawLocationBtn() {
        locationBtn.setTitle ("current location", forState: .Normal)
//        locationBtn.titleLabel!.font = UIFont(name: "Raleway-SemiBold", size: 34.0)
//        locationBtn.backgroundColor = UIColor.whiteColor()
//        locationBtn.setTitleColor(UIColor(red: 64/255, green: 156/255, blue: 73/255, alpha: 1.0), forState: .Normal)
//        locationBtn.titleLabel?.textAlignment = NSTextAlignment.Left
        self.view.addSubview(locationBtn)
        locationBtn.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Location Button Leading -
        let locationBtnLeading = NSLayoutConstraint(
            item: locationBtn,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 25.0)
        
        // - Location Button Trailing -
        let locationBtnTrailing = NSLayoutConstraint(
            item: locationBtn,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: -25.0)
        
        // - Location Button Top -
        let locationBtnTop = NSLayoutConstraint(
            item: locationBtn,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: introPlusLocationLabel,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 10.0)
        
        // - Location Button Height -
        let locationBtnHeight = NSLayoutConstraint(
            item: locationBtn,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1.0,
            constant: 50.0)

        
        self.view.addConstraints([locationBtnLeading, locationBtnTrailing, locationBtnTop, locationBtnHeight])
        
    }

    


}



/*

okay, so for this viewcontroller, I want 3 labels
3 buttons that lead to a different screen

plus 1 actual button

I need 2 types of the dropdown buttons
    1 that is when 1 option selected
    1 that is when multiple options selected (so with x)




*/
