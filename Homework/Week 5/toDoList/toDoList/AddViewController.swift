//
//  AddViewController.swift
//  toDoList
//
//  Created by Johanna Ostrich on 2/4/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

protocol NewToDo {
    func addToDoItem(toDoName: String)
}

class AddViewController: UIViewController {

    @IBOutlet weak var textFieldNewItem: UITextField!
    
    var delegate: NewToDo?
    
    @IBAction func addItemToListButton(sender: AnyObject) {
        self.delegate?.addToDoItem(textFieldNewItem.text)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
