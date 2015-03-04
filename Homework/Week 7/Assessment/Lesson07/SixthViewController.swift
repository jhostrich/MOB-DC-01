
//
//  SixthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSTemporaryDirectory() + "todo5Array.txt"
        //let myString: NSArray? = NSArray(contentsOfFile: path)
        //println(myArray)
        
        
        let myString: NSString? = NSString(contentsOfFile: path, encoding: NSUTF32StringEncoding, error: nil) as String
        println(myString)
        if let readString = myString {
            println("testing")
            self.textView.text = "Here's the content of the previous TODO: \n\(readString)"
        }
        

    }
}
