//
//  FourthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = NSTemporaryDirectory() + "textFile.txt"
        let myString: NSString? = NSString(contentsOfFile: path, encoding: NSUTF32StringEncoding, error: nil)
        
        if let readString = myString {
            self.textView.text = "Here's the content of the previous TODO: \n\(readString)"
        }
    }
}
