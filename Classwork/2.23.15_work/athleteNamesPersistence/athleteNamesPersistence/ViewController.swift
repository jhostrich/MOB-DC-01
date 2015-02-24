//
//  ViewController.swift
//  athleteNamesPersistence
//
//  Created by Johanna Ostrich on 2/23/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var myAthletes = defaults.objectForKey("athletes") as NSArray as Array
        println(myAthletes)
        
        
        var coachesPath = NSBundle.mainBundle().pathForResource("Coaches", ofType: "plist")
        var myCoaches = NSMutableArray(contentsOfFile: coachesPath!)
        
        myCoaches!.addObject(["Name": "PeppermintPatty", "Sport": "Piano", "Years": "2"])
        
        myCoaches?.writeToFile(coachesPath!, atomically: true)
        println(myCoaches!)

    }



}

