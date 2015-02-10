//
//  ViewController.swift
//  autolayout2
//
//  Created by Johanna Ostrich on 2/9/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var verticalSpacingBetweenPurpleGhostAndPacman: NSLayoutConstraint!
    
    @IBAction func increaseDistanceBetweenPacmanAndGhost(sender: AnyObject) {
        self.verticalSpacingBetweenPurpleGhostAndPacman.constant += 80
        // here we set the distance to 80
        
        UIView.animateWithDuration(1, animations: {
            self.view.layoutIfNeeded()
            // we need this if we want to animate a constraint--first set constraint change(s), then set animation this way
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

