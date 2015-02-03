// Playground - noun: a place where people can play

import UIKit



// Here's some code for the GA Campuses that I messed up

in viewDidLoad:

self.addTextBox.delegate = self
self.errorMessage.hidden = true

func textFieldShouldReturn(textField: UITextField) -> Bool {
    if self.addTextBox.text.isEmpty {
        println("Your text field is empty, enter something")
        textField.resignFirstResponder()
        self.errorMessage.hidden = false
    } else {
        self.errorMessage.hidden = true
    }
    return true
}




/*

Delegation passes data around
When we're passing our own Protocols, it's defined in Sender and Receiver adheres

*/



// NOTIFICATIONS

/*

Notification centers are also ways for us to pass data around
Notification pattern built off singleton pattern

when we instantiate a class, we have an object

singleton is a class that only has 1 instance
centralization!

global settings are good to put in 1 place
so are log files

whenever pass notifications, don't want duplicates, want 1 place handling it all


*/





More for GA campuses

under ViewDidLoad
self.hiddenLabel.hidden = true
(added hiddenLabel on storyboard)

also add Post Notification button to storyboard--we'll call it pressPostButton

@IBAction func pressPostButton (sender: AnyObject) {
    // First step in setting notification
    NSNotificationCenter.defaultCenter().postNotificationName("unhideHiddenLabels", object: nil)
    // this is just saying that the default Center is our main one
    // post is the method for setting it
    // can pass data through the object:, but don't want to pass anything now, so set to nil
}
// we want to listen for notifications in viewDidLoad

in viewDidLoad:
NSNotificationCenter.defaultCenter().addObserver(self,
                                    selector: "unhideCurrentLabels:",
                                    name: "unhideHiddenLabels",
                                    object: nil)

// selector is function that runs as soon as notification is triggered

func unhideCurrentLabels(notification: NSNotification) {
    self.hiddenLabel.hidden = false
    println("Triggered")
}



// addObserver is what's listening for our notification
// unhideHiddenLabels is what it's listening for


// Only 3 steps for notifications, while delegation has more like 7
// But they're not doing the same thing

// So for this, hit Post notification, and then everywhere in the app that's listening will hear it, run the function




// Post, Listen, Execute
// We have notifications that come with iOS--so only last 2 steps are necessary

// if we're listening for notifications that are already available, put it in viewDidLoad:
NSNotificationCenter.defaultCenter().addObserver(self, selector: "textHasChanged:",
    name: UITextFieldTextDidChangeNotification, object: nil)

func textHasChanged(notification: NSNotification) {
    println("Hooray, text has changed")
}



// refresh--is a notification, like when refresh in Twitter
// Home button on app
// App delegate gives us a lot of these methods
// Notifications are state changes, delegates pass data

// notifications should be as abstract as possible, just be triggers
