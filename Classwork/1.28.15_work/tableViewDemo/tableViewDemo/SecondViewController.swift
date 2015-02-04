//
//  SecondViewController.swift
//  tableViewDemo
//
//  Created by Johanna Ostrich on 1/28/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

// howdy

// should give protocols noun names, not verbs--good practice
protocol Campus {
    func addCampus(campusName: String)
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var addTextBox: UITextField!
    
    var delegate: Campus?
    // this is referring to the protocol
    // optional, because sometimes we'll come to this screen and not have Campus
    
    @IBAction func saveAndGoBack(sender: AnyObject) {
        self.delegate?.addCampus(addTextBox.text)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

 
 }
