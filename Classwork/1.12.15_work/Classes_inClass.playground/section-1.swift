// Playground - noun: a place where people can play

import UIKit

// Classes always start with a capital letter, plus file names need to match class name
// This is why start variables and functions with lowercase letters, to differentiate
// It'll run if you don't do this, but this is super-needed best practice

// Variables that belong to classes are called properties
// Functions that belong to classes are called methods

// Pretty much never want global functions and variables, should always belong to a class
class Animal {
    // var numberOfLegs = 0
    var numberOfLegs: Int
    var hasFur = true
    var noise = "AAAAAAAAH"

    
    // This init is a know function word, so we don't have to use the func word when declaring
    // It's requiring the user to set the number of legs--it's the first thing that runs
/*    init(numberOfLegs: Int) {
        
    }

    or could do it this way--the point being the var after init( only applies to that spot, though it is best practice to call it the same thing
        in other words, legs is inside of init, so not valid outside of it--scoping!
*/
    init(legs: Int) {
        numberOfLegs = legs
    }
    
    
    
    
    
    func speak() {
        println(self.noise)
    }
}


// Instantiating a new class (called an instant/object)
var tedi = Animal(legs: 2)
tedi.hasFur = false

tedi.numberOfLegs = 2
println(tedi.numberOfLegs)
tedi.speak()

// Now I have to set legs value as soon as I create the instance
var ena = Animal(legs: 4)
ena.hasFur = true
ena.numberOfLegs = 4
println(ena.hasFur)

// If we declare a variable without setting it, we make it an optional
// var hasFur
// vs. var hasFur = true


// Why would we use init? Well, maybe user must put in language before go any farther


// put all init properties together
class Animal2 {
    init (numberOfLegs: Int, hasFur: Bool) {
        
    }
}

class Animal3 {
    var numberOfLegs: Int
    var hasFur: Bool
    
    init(legs: Int, hasFur: Bool) {
        self.numberOfLegs = legs
        self.hasFur = hasFur
        // legs and hasFur are local variables
    }
}
// self refers to the class
//to access class properties from inside the class, do self.property