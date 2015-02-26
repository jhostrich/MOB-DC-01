//
//  ViewController.swift
//  flatFiles
//
//  Created by Johanna Ostrich on 2/25/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // access to the temp directory by creating a temporary path; it's a string--basically a url
        var tempPath = NSTemporaryDirectory() + "hello.txt"
        
        //var stringToSave = "hello world"
        
        var stringToSave = self.textView.text
        
        stringToSave.writeToFile(tempPath, atomically: true, encoding: NSUTF32StringEncoding, error: nil)
        // NSUTF8 is usually the one to go with for encoding
        
        // getting access to file manager, so can interact with it
        var fileManager = NSFileManager()
        
        
        // we have to tell it the path (temp directory), need the content we're storing, and then we need to write to file
        
        
    }

    @IBAction func loadData(sender: UIButton) {
        
        var txtPath = NSTemporaryDirectory() + "hello.txt"
        
        // Good practice to make optional--if we have problems accessing the file, we can check if it's nil
        var stringToLoad: NSString? = NSString(contentsOfFile: txtPath, encoding: NSUTF32StringEncoding, error: nil)
    
        if let loadedContent = stringToLoad {
            println("Content loaded. Content is \(loadedContent)")
        } else {
            println("Could not load")
        }
        
//        println("Loading content without checking if nil: \(stringToLoad!)")
        
        
        
        // NSString is a custom type we get from Objective C--it give us awesome methods to use
        // it's a class we can use w/CocoaTouch and iOS
        
        
        // CocoaTouch = UIKit + Foundation
    }
  
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

