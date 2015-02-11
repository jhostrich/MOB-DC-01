//
//  ViewController.swift
//  robotFace
//
//  Created by Johanna Ostrich on 2/9/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var robotMouth: UIView!
    
    @IBOutlet weak var heightOfRobotMouth: NSLayoutConstraint!
    
    @IBAction func tapOnNose(sender: AnyObject) {
        
        // ----- CHANGE COLOR WHEN TAP NOSE -----
        if self.robotMouth.backgroundColor == UIColor.purpleColor() {
            UIView.animateWithDuration(1, animations: {
                self.robotMouth.backgroundColor = UIColor.redColor()
            })
        } else {
            UIView.animateWithDuration(1, animations: {
                self.robotMouth.backgroundColor = UIColor.purpleColor()
            })
        }
        
        // ----- CHANGE HEIGHT WHEN TAP NOSE -----
        if self.heightOfRobotMouth.constant == 150 {
            self.heightOfRobotMouth.constant = 200
            UIView.animateWithDuration(2, animations: {
                self.view.layoutIfNeeded()
            })
        } else {
            self.heightOfRobotMouth.constant = 150
            UIView.animateWithDuration(2, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

