//
//  EvenOrOdd.swift
//  Lesson02
//
//  Created by Johanna Ostrich on 1/18/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import Foundation

class EvenOrOdd {
    var number = 0
    func evenCheck(number: Int) -> String {
        if number % 2 == 0 && number != 0 {
            return "It's even"
        } else {
            return "It's not even"
        }
    }
    
    
    
}