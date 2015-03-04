//
//  ViewController.swift
//  NetworkingExamples
//
//  Created by Johanna Ostrich on 3/2/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://tedi.io")

        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            
            // Note: our data comes back as NSData, so we need to convert to string
            // Pass our NS Data return to a string
            var stringData = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            // UI updates need to happen on the main thread. By default, NSURLSession connections happen as a side thread, so we have to access our main thread to update our views.
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.textView.text = stringData
            })
            
        })
        
        task.resume()

        
    }



}

