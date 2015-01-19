//
//  FibonacciAdder.swift
//  Lesson02
//
//  Created by Johanna Ostrich on 1/19/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import Foundation

class FibonacciAdder {
    
    var indexOfFibonacciNumber: Int
    var isFibValid: Bool
    
    init (indexOfFibonacciNumber: Int?) {
        if let fibCheck = indexOfFibonacciNumber {
            self.indexOfFibonacciNumber = fibCheck
            isFibValid = true
        } else {
            self.indexOfFibonacciNumber = 0
            isFibValid = false
        }
    }

    
    func fibonacciNumberAtIndex() -> Int {
        if !isFibValid {
            return 0
        }
      
        var current = 0, next = 1, result = 0
        for index in 1...indexOfFibonacciNumber {
            let tempVar = current
            current = next
            next = tempVar + current
            result = tempVar
        }
        return result
    }
    

}