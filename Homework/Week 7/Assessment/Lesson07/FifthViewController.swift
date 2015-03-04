//
//  FifthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let charactersArray : [String] = self.textView.text.componentsSeparatedByString(" ")
        println(charactersArray)
        
        var tempPath = NSTemporaryDirectory() + "todo5Array.txt"
        var arrayToSave: NSArray? = NSArray(array: charactersArray)
        
        if let content = arrayToSave {
            arrayToSave!.writeToFile(tempPath, atomically: true)
            println("Array saved. Array is \(arrayToSave)")
        } else {
            println("Could not save")
        }
        
        

//        let charactersArray : NSArray = Array(arrayLiteral: self.testTextView.text)
//       // let charactersArray: NSArray = (contentsOfFile: characters)
//        println("Array saved. Array is \(charactersArray)")
//        
//        //let arrayOfNames: NSArray = ["A", "B", "C"]
//        
//        var tempPath = NSTemporaryDirectory() + "todo5Array.txt"
//        var arrayToSave = charactersArray
//        
//        //var newArray = arrayOfNames
//        
//        //if let content = arrayToSave {
//            arrayToSave.writeToFile(tempPath, atomically: true)
//            println("Array saved. Array is \(arrayToSave)")
//            println("\(arrayToSave.count)")
////        } else {
////            println("Could not save")
////        }
    }
    
}
