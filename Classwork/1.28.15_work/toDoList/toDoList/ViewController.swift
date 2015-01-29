//
//  ViewController.swift
//  toDoList
//
//  Created by Johanna Ostrich on 1/28/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var toDoList = ["Wake up", "Eat breakfast", "Brush my teeth", "Take shower", "Go to work"]
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func appendButton(sender: AnyObject) {
        toDoList.append(textField.text)
        println(toDoList.last!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoList.append("Be productive")
        for i in toDoList {
            println(i)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

