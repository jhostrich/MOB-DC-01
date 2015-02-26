//
//  ViewController.swift
//  practiceFlatFile
//
//  Created by Johanna Ostrich on 2/25/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func saveBtn(sender: UIButton) {
    
        // We want to save a file in Documents Directory
        // So first thing is need to locate the Documents Directory
        let fileManager = NSFileManager()
        
        // good practice to set this up as array--we actually only have 1 url now, but good to do it this way
        let urls = fileManager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask) as [NSURL]
        
        if urls.count > 0 {
            let documentPath = urls[0].relativePath! as String
            // absoluteString vs relativeString--has to do with absolute vs relative URLs

            let mySavedPath = documentPath + "/savedFile.txt"
            
            var stringToSave = self.textView.text
            
            stringToSave.writeToFile(mySavedPath, atomically: true, encoding: NSUTF32StringEncoding, error: nil)
            println("Content \(stringToSave) is saved. Content path is \(mySavedPath)")
        } else {
            println("Could not save")
        }
        
    }
    
    // can also save arrays and dictionaries into our flat files
    
    @IBAction func loadBtn(sender: UIButton) {
        
        let fileManager = NSFileManager()
        
        let urls = fileManager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask) as [NSURL]
        
        // if documents path exists, run the following code
        if urls.count > 0 {
            // concatenating our file name after documents path
            let documentPath = urls[0].relativePath! as String
            let myLoadedPath = documentPath + "/savedFile.txt"
            
            // Access our file from the path we defined above
            var stringToLoad: NSString? = NSString(contentsOfFile: myLoadedPath, encoding: NSUTF32StringEncoding, error: nil)
            
            // If the file exists, run the block below
            if let loadedContent = stringToLoad {
                println("Content \(loadedContent) is loaded. Content path is \(myLoadedPath)")
            } else {
                println("Could not load")
            }
        } else {
            println("Could not load")
        }
    }
    
    
    
    // writeToFile completely rewrites the file with the content we pass in there--so if there's already info in there, it'll be gone
    
}

