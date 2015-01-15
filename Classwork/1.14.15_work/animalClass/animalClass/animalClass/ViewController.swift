//
//  ViewController.swift
//  animalClass
//
//  Created by Johanna Ostrich on 1/14/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func catButton(sender: AnyObject) {
        var myCat = Animal()
        myCat.species = "cat"
        myCat.name = nameTextField.text
        myLabel.text = myCat.stringRepresentation()
    }
    
    @IBAction func dogButton(sender: AnyObject) {
        var myDog = Animal()
        myDog.species = "dog"
        myDog.name = nameTextField.text
        myLabel.text = myDog.stringRepresentation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

