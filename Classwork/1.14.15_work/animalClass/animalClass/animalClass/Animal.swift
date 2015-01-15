//
//  animal.swift
//  animalClass
//
//  Created by Johanna Ostrich on 1/14/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import Foundation

class Animal {
    var species = "fish"
    var name = "Bob"
    
    func stringRepresentation() -> String {
        return ("The animal is a \(self.species) named \(self.name)")
    }
    // Note--could also be:
    // return "The animal..." (no parentheses)
    
}
