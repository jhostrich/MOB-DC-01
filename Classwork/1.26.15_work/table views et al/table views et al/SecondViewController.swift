//
//  SecondViewController.swift
//  table views et al
//
//  Created by Johanna Ostrich on 1/26/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBAction func goBackToFirstVC(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
        // this is the card stack thing--our current view controller pops back one, so previous now shows
        // there's also one that brings you back to root
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
