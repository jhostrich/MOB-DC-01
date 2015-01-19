//
//  EvenOrOdd.swift
//  Lesson02
//
//  Created by Johanna Ostrich on 1/18/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import Foundation

class EvenOrOdd {

    var number: Int
    var isNumValid: Bool
    init (number: Int?) {
        if let numCheck = number {
            self.number = numCheck
            isNumValid = true
        } else {
            self.number = 0
            isNumValid = false
        }
    }

    
    func evenCheck() -> String {
        if !isNumValid {
            return "Number is invalid"
        }
        
        if number % 2 == 0 {
            return "It's even"
        } else {
            return "It's not even"
        }
    }    
    
    
    
}