//
//  ViewController.swift
//  IB.Coding
//
//  Created by Johanna Ostrich on 1/12/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

// This class controls everything in this view, so put all our code for this view inside this class
class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func changeLabel(sender: AnyObject) {
        nameLabel.text = nameTextField.text
    }
    
    @IBAction func changeLabelOnDrag(sender: UISlider) {
        let sliderValue = Int (sender.value)
        nameLabel.text = "\(sliderValue)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("Testing loaded view")
    }


}

