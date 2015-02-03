//
//  ViewController.swift
//  ios_delegates
//
//  Created by Johanna Ostrich on 2/2/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var gaCampuses: [String] = []

    @IBOutlet weak var stuffTextField: UITextField!
    @IBOutlet weak var campusesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // To set up the text field delegate:
            // 1. add UITextFieldDelegate protocol
            // 2. connect text field outlet
            // 3. tie textField.delegate = self
            // 4. Add the text field method
        
        // this is different than for tableView, because tableView has different/more built-in functionalities
        
        if gaCampuses.isEmpty {
            println("Your table view is empty")
            campusesTable.hidden = true
        }
        
        stuffTextField.delegate = self
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        println("Return key pressed")
        return true
    }

    
    // when inherit from UITableViewController, inherit a bunch of methods, including numberOfSectionsInTableView, tableView
    // but when using the UITableViewDelegate instead, it's requiring we have those methods but not inheriting them, so no need to override the func

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.gaCampuses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
        
        cell.textLabel?.text = self.gaCampuses[indexPath.row]
        
        return cell
    }

    // UITextFieldDelegate protocol doesn't require anything--optional things
    
    
    
}

// delegate and data source