//
//  ViewController.swift
//  table views et al
//
//  Created by Johanna Ostrich on 1/26/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBOutlet weak var swipeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateRightSwipeOnRedBox()
        initiateDoubleTapOnRedBox()
        
    }

    //--------------- Right Swipe ---------------
    
    func initiateRightSwipeOnRedBox() {
        let swipeR = UISwipeGestureRecognizer(target: self, action: "swipedRight:")
        // action always takes a string--the name of the method, with ":"
        // target: self--> refers to swipeR, it's basically always going to be self
        
        swipeR.direction = UISwipeGestureRecognizerDirection.Right
        
        self.swipeView.addGestureRecognizer(swipeR)
        // why self.? because we're inside the class where that var is defined
        
    }
    
    func swipedRight(sender: UISwipeGestureRecognizer) {
//        self.resultsLabel.text = "You swiped right."
        
        self.performSegueWithIdentifier("showSecondVC", sender: self)
    }
    
    
    //--------------- Double Tap ---------------
    
    func initiateDoubleTapOnRedBox() {
        let dTap = UITapGestureRecognizer(target: self, action: "doubleTapped:")
        // so here we're saying, I want a new instance of the tap gesture class
        
        dTap.numberOfTapsRequired = 2
        // assign number of taps
        
        self.swipeView.addGestureRecognizer(dTap)
        // assigning tap gesture to the red box, swipeView
    }
    
    func doubleTapped(sender: UITapGestureRecognizer) {
//        UIView.animateWithDuration(1.0, animations: {
//            self.swipeView.backgroundColor = UIColor.blueColor()
//        })
        // this setup with animateWithDuration where have (integer, then a function {})--called a closure

        var thirdVC = self.storyboard?.instantiateViewControllerWithIdentifier("thirdVC") as ThirdViewController
        // there's a ? after storyboard, because before compiles, there's not a storyboard yet
        //    or something like that--doesn't matter, it'll autocorrect it for us
        // this is a form of typecasting
        
        self.presentViewController(thirdVC, animated: true, completion: nil)
        // when it hits completion, we could have it do something by putting a function in
        // if we don't want it to do anything, we just put in nil
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

