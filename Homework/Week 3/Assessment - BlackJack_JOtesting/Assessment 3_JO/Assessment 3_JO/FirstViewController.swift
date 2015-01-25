//
//  FirstViewController.swift
//  Assessment 3_JO
//
//  Created by Johanna Ostrich on 1/25/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    let newGame = CardGame()
    
    @IBOutlet weak var playerNameField: UITextField!
    
    
    @IBOutlet weak var betAmountField: UITextField!
    
    
    @IBAction func getStartedWithPlayer(sender: AnyObject) {
        self.newGame.name = playerNameField.text
        self.newGame.betAmount = betAmountField.text.toInt()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
}

