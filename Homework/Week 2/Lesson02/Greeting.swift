//
//  Greeting.swift
//  Lesson02
//
//  Created by Johanna Ostrich on 1/17/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import Foundation

class Greeting {
    var name = "world"
    var age: Int?
    init (age: Int) {
        self.age = age
    }

    
    func helloWorld() -> String {
        return "Hello world"
    }
    
    
    func helloYou() -> String {
        if let ageCheck = age {
            return "Hello \(name), you are \(ageCheck) years old."
        } else {
            return "Hello \(name)."
        }
    }
    
    
    func oldEnoughTo() -> String {
        if age >= 21 {
            return "You can drink."
        } else if age >= 18 {
            return "You can vote."
        } else if age >= 16 {
            return "You can drive."
        } else {
            return "Better luck next time, kid."
        }
    }

    
    func oldEnoughToComplex() -> String {
        if age >= 21 {
            return "You can drive, vote, and drink (but not at the same time)!"
        } else if age < 21 && age >= 18 {
            return "You can drive and vote."
        } else if age < 18 && age >= 16 {
            return "You can drive."
        } else if age > 0 {
            return "Better luck next time, kid."
        } else {
            return " "
        }
    }


}