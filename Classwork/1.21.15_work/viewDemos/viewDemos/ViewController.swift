//
//  ViewController.swift
//  viewDemos
//
//  Created by Johanna Ostrich on 1/21/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func swipeSquareRight(sender: UISwipeGestureRecognizer) {
        UIView.animateWithDuration(1.5, animations: {
            self.mySquare.backgroundColor = UIColor.redColor()
            self.mySquare.alpha = 0.5
            // could put as many items in here as I want to animate on load--don't need a separate function for each animation
        })
    }
    
    
    @IBAction func swipeSquareLeft(sender: UISwipeGestureRecognizer) {
        UIView.animateWithDuration(1.5, animations: {
            self.mySquare.backgroundColor = UIColor.purpleColor()
            self.mySquare.alpha = 1
        })

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

