//
//  ThirdViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var tempPath = NSTemporaryDirectory() + "textFile.txt"
        
        var stringToSave = self.textView.text
        
        if let content = stringToSave {
            stringToSave.writeToFile(tempPath, atomically: true, encoding: NSUTF32StringEncoding, error: nil)
            println("Content saved. Content is \(content)")
        } else {
            println("Could not save")
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
}
