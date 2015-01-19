//
//  SecondViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    
    @IBOutlet weak var numberField: UITextField!
    
    
    @IBOutlet weak var numberLabel: UILabel!
    
    
    @IBAction func addButton(sender: AnyObject) {
        var newNumber = AddNumbers(entered: 0)
        newNumber.entered = numberField.text.toInt()

//        var current = numberLabel.text.toInt()
//        var newest = newNumber.addButtonClicks()
//        numberLabel.text = String(current + newest)
        
    }
    
    //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
}
