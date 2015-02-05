//
//  ViewController.swift
//  programmaticViews
//
//  Created by Johanna Ostrich on 2/4/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ----- RED BOX -----
        var redBox = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        redBox.backgroundColor = UIColor.redColor()
        // note: didn't do self, because this is inside function; if were just inside the class, would have done self.
        
        redBox.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleBottomMargin
        
        self.view.addSubview(redBox)
        // we're giving this a parent view—-when using IB it happens automatically, but since we're setting this all up programmatically, need to set here
        // self.view is the main, high-level view that our controller is associated with
        
        
        // ----- RED BOX LABEL -----
        var redBoxLabel = UILabel(frame: CGRect(x: 50, y: 50, width: 100, height: 30))
        redBoxLabel.text = "Hello world"
        redBoxLabel.textColor = UIColor.whiteColor()
        redBoxLabel.textAlignment = .Center
        redBox.addSubview(redBoxLabel)
        // for label width, if wanted to be same width as redBox parent, could do width: redBox.frame.width
        // frame is a struct with the 4 properties: x coord, y coord, width, and height
        // frame: redBox.frame
        
        // for circles or rounded corners, use corner radius
          // redBox.layer.cornerRadius = 50
        // mask to bounce on container--is like a clipping mask
        
        
        // ----- PURPLE BUTTON -----
        var actionBtn = UIButton(frame: CGRect(x: 0, y: 300, width: self.view.frame.width, height: 30))
        actionBtn.setTitle("Click me!", forState: .Normal)
        actionBtn.addTarget(self, action: "pressedCodedButton:", forControlEvents: .TouchUpInside)
        actionBtn.backgroundColor = UIColor.purpleColor()
        // .TouchUpInside is actually UIControlEvents.TouchUpInside, but it knows it so we don't have to say it
        actionBtn.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        
        self.view.addSubview(actionBtn)
        
        /*
        // ----- LEFT SHARK IMAGE -----
        var leftSharkImg = UIImage(named: "katy-perry-14-super-bowl-halftime-xlix-2015-billboard-650.jpg")
        // UIImage isn't something that actually shows up on your screen--it's just a reference--we need to set up a view where we can see it
        var leftSharkImgView = UIImageView(image: leftSharkImg)
        leftSharkImgView.frame = CGRect(x: 50, y: 350, width: leftSharkImg!.size.width/2.25, height: leftSharkImg!.size.height/2.25)
        leftSharkImgView.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleRightMargin
        
        self.view.addSubview(leftSharkImgView)
        
        // we don't have that much here right now, but when have a lot of these in viewDidLoad, Tedi likes to put each of these into a function (below) and just call the functions in viewDidLoad
        // so functions like drawRedBox, drawRedBoxLabel, etc
        */
        
        
        // ----- BOX SCROLL VIEW -----
        // scrolling is very powerful, because can scroll horizontally, vertically, and zoom in
        var boxScrollView = UIScrollView(frame: CGRect(x: 50, y: 350, width: 200, height: 300))
        boxScrollView.backgroundColor = UIColor.lightGrayColor()
        boxScrollView.contentSize = CGSize(width: 200, height: 600)
        
        self.view.addSubview(boxScrollView)
        
        
        // ----- COLOR BOXES -----
        var greenBox = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
        greenBox.backgroundColor = UIColor.greenColor()
        
        var yellowBox = UIView(frame: CGRect(x: 0, y: 150, width: 200, height: 150))
        yellowBox.backgroundColor = UIColor.yellowColor()
        
        var purpleBox = UIView(frame: CGRect(x: 0, y: 300, width: 200, height: 150))
        purpleBox.backgroundColor = UIColor.purpleColor()
        
        boxScrollView.addSubview(greenBox)
        boxScrollView.addSubview(yellowBox)
        boxScrollView.addSubview(purpleBox)


    }

    
    func pressedCodedButton (sender: UIButton) {
        println("Hello world")
        sender.removeFromSuperview()
        // we have access to the button because we have self in there as target
    }

    
    // flow is create instance of class, add some properties, and then add as a subview
    
    
    
    
    
}

