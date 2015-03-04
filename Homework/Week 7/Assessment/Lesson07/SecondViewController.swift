//
//  SecondViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var mySliderValue: AnyObject? = defaults.objectForKey("settings_slider")
        
        if mySliderValue == nil {
            self.textView.text = "Slider value doesn't exist."
        } else {
            self.textView.text = "Slider value is \(mySliderValue!)"
        }
        
    }
}