//
//  SecondViewController.swift
//  Whisperer
//
//  Created by Johanna Ostrich on 3/11/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var feedback: UILabel!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // making it remember our currently logged-in user
        var currentUser = PFUser.currentUser()
        
        if currentUser != nil {
            println("You are logged in!")
            println(currentUser)
        } else {
            println("Not logged in!")
        }
    }

    
    // register
    @IBAction func register(sender: AnyObject) {
        var user = PFUser()
        user.username = self.username.text
        user.password = self.password.text
        user.email = self.username.text
        // we're making an assumption that usernames will always be emails--if this is what we want, we need to have a check in our username to make sure it's an email
        
        user.signUpInBackgroundWithBlock { (succeeded: Bool!, error: NSError!) -> Void in
            if error == nil {
                self.feedback.text = "Successfully signed up!"
                self.username.text = ""
                self.password.text = ""
            } else {
                let userError = error.userInfo!["error"] as? NSString
                self.feedback.text = userError
            }
        }
        // the WithBlock means as soon as this is executed, it can run a block of code
    }
    
    
    // login
        // okay, so we want to login and then keep the user logged in (remember the user on machine)
        // oh man, this will be so hard. wait, never mind, Parse does this for us!
    @IBAction func logIn(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(self.username.text, password: self.password.text) { (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                self.feedback.text = "Successfully logged in!"
            } else {
                self.feedback.text = "Error logging in!"
                // it's good to give a vague error here--not say which one is wrong and which one is right--in case someone just randomly guessing to hack someone's account--don't want to help them out
            }
        }
    }

    // this API works in Android too
    
    // can set roles for users--have certain menus for admins, etc
    // this can be used on website too
    
    
    // SECURITY
        // Super secure--encryption starts as soon as leaves app
        // but stuff still on the app isn't encrypted, so for super sensitive info, would need something more
        // don't store sensitive info (credits cards, etc on app--just don't do it
        // use third party service, like Stripe, Authorization.net (I think I got those right)
    
    
}