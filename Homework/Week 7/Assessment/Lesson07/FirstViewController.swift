//
//  FirstViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var myTestString = defaults.objectForKey("test_string") as NSString as String
        
        var myTestNumber = defaults.integerForKey("test_number") as NSInteger as IntegerLiteralType
        
        self.textView.text = "Test string is: \(myTestString). \nTest number is: \(myTestNumber)."

    }
}