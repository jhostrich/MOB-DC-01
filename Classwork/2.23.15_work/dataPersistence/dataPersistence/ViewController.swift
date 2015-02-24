//
//  ViewController.swift
//  dataPersistence
//
//  Created by Johanna Ostrich on 2/23/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        
        // defaults.setObject("light", forKey: "theme")
        
        // Pull the value for the theme key stored in NSUserDefaults
        let theme = defaults.objectForKey("theme") as String
                                // sometimes need as NSString as String
                                // just a weird Xcode bug
        // we setObject, so our object wasn't typecast--that's why we're typecasting it as a string here
        
        println(theme)
        // check yourself before you wreck yourself
        
        if theme == "dark" {
            self.helloLabel.textColor = UIColor.whiteColor()
            self.view.backgroundColor = UIColor.blackColor()
        } else {
            self.helloLabel.textColor = UIColor.blackColor()
            self.view.backgroundColor = UIColor.whiteColor()
        }

        
        
        var booksPath = NSBundle.mainBundle().pathForResource("Books", ofType: "plist")
        // everything we see in our left-hand list is part of our main bundle--so don't need to specify folder path
        
        var books = NSArray(contentsOfFile: booksPath!)
        // ! is called bang
        //println(books!)
        // will always come back as an optional
        
        //println(books![0]["Author"])
        
        
        // right now, this is read only--as default (just get, not get set)
        
        // so how do we want to write to it
        // let's say, change title name of first book
        // in that case:
        var books2 = NSMutableArray(contentsOfFile: booksPath!)
        
        //println(books![0])
        
        
        books2![0].setValue("Ena's World 2", forKey: "Title")
        
        // writes change to file
        books2?.writeToFile(booksPath!, atomically: true)
        // atomically: true--means it backs up while saving, so you're not screwed if crashes mid-save
        // note: it's not going to add to our plist file in Xcode--this is because the simulator won't edit plist--but actual app will do it
        
        println(books2!)
        
    }


    
}

