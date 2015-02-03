//
//  AddEventViewController.swift
//  Delegation
//
//  Created by Thomas Degry on 28/01/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

protocol EventProtocol {
    func addEvent(newEvent: Event)
}


class AddEventViewController: UIViewController {

    @IBOutlet var nameLabel: UITextField!
    @IBOutlet var locationLabel: UITextField!
    
    var delegate: EventProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ----- Setting nav buttons--Cancel and Save -----
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "dismiss")
        let saveButton = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.Plain, target: self, action: "save")

        self.navigationItem.title = "Add Event"
        self.navigationItem.setLeftBarButtonItem(cancelButton, animated: true)
        self.navigationItem.setRightBarButtonItem(saveButton, animated: true)
        // self.navigationItem.leftBarButtonItem = cancelButton
        // self.navigationItem.rightBarButtonItem = saveButton
        // this does more or less the same thing
        // set method is a little more robust--has some built-in animations if replace button
    }
    
    // IBOutlets and such refer to the storyboard--don't need to write this word when doing programmatically
    
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func save() {
        let newEvent = Event(name: nameLabel.text, location: locationLabel.text)
        self.delegate?.addEvent(newEvent)
        dismiss()
    }
    
    
}
