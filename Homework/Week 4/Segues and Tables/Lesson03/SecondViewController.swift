//
//  SecondViewController.swift
//  Lesson03
//
//  Created by Johanna Ostrich on 1/26/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    //--------------- Dismiss button ---------------
    @IBAction func goBackToFirstVC(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
