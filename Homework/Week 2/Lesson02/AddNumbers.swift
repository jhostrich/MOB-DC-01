//
//  AddNumbers.swift
//  Lesson02
//
//  Created by Johanna Ostrich on 1/18/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import Foundation

class AddNumbers {
    var entered: Int?
    init (entered: Int) {
        self.entered = entered
    }
    
    var sum = 0
    
    func addButtonClicks() -> Int {
        if let clicks = entered {
            sum += clicks
            return sum
        
        } else {
            return 0
        }
        
    }
    
    
    
}

