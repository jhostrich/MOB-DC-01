// Playground - noun: a place where people can play

import UIKit

import Foundation

class Animal {
    var species = "fish"
    var name = "Bob"
    
    func stringRepresentation() -> String {
        return ("The animal is a \(self.species) named \(self.name)")
    }
    
    
    
}
var myAnimal = Animal()
    myAnimal.stringRepresentation()
