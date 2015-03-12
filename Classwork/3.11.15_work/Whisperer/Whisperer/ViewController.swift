//
//  ViewController.swift
//  Whisperer
//
//  Created by Johanna Ostrich on 3/11/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var whisper: UITextView!
    
    @IBOutlet weak var whisperCat: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // add object to core data entity (a row)
    @IBAction func saveWhisper(sender: AnyObject) {
        
        var whisperP = PFObject(className: "Whisper")
        // note: PFObject is a Parse object
        // also note: since "Whisper" class doesn't already exist, it will create it for us when we call it this way
        // the same thing with the properties (headers in table)--it'll create all these properties as we set them
        // date and id are added by default--databases pretty much always do this
        // in parse, table = entity = class
        
        whisperP["whisper"] = self.whisper.text
        whisperP["user"] = "Johanna"
        whisperP["category"] = self.whisperCat.text
        
        whisperP.saveInBackgroundWithBlock { (success: Bool, error: NSError!) -> Void in
            if (success) /* this is the shorthand of "if success == true" */ {
                println(whisperP.objectId)
                println("Whisper saved successfully!")
                self.whisper.text = ""
                self.whisperCat.text = ""
                
                // Parse takes care of sticking all this on main thread for us
                
            } else {
                println(error.description)
                // be careful with feeding user the description--this depends on the API--sometimes the error is useful and descriptive, sometimes a big pile of confusing--and don't want to feed that to your user
                
            }
            
            // it's good practice to disable the Create button as soon as it's pressed, re-enable it once it's been saved to core data--just to make sure it doesn't have issues and save multiple times if connection is problematic
            // pinning is when send request to cache, until network can perform it--I think this is really easy to do in Parse--it's a good practice to do this!
            
            
            // we can also store arrays in Parse
            
            // let people register with their emails, not usernames--nobody remembers their usernames
            
            // with Parse, we can save user objects
            
        }
            
            
            
    }

    // perform a query--basic filter
    @IBAction func readWhispers(sender: AnyObject) {
        var whisperQuery = PFQuery(className: "Whisper")
        whisperQuery.whereKey("category", equalTo: self.whisperCat.text)
        whisperQuery.findObjectsInBackgroundWithBlock { (whisperObjects: [AnyObject]!, error: NSError!) -> Void in
            for whisper in whisperObjects {
                if let whisperTitle = whisper["whisper"] as? String {
                    //we're typecasting here because this is coming from a dictionary, and Swift doesn't know what's coming from it--so we need to typecast it as a string
                    
                    
                    println(whisperTitle)
                }
            }
            // this is creating an array with all the objects in our query
        
        }
    
    }
    
    
    // if want more robust filter, use Predicate--the syntax is all in Parse's sweet documentation
    
    
    // there are no optionals in Objective C
    // it's super easy to upgrade your account if you're getting too many requests--just pay them
    
    
    // let's talk about Users
        // Parse encrypts stuff for us, so we don't have to do it!
        // for users, need to at least have username and password (and when I say username, I mean email address--see above)
    
        // Parse won't let you create duplicate usernames--it'll deny you, say that username is already taken
    
}

