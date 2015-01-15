// Playground - noun: a place where people can play

import UIKit


class Animal {
    var species = "fish"
    var name = "Bob"
    
    func stringRepresentation() -> String {
        return ("The animal is a \(self.species) named \(self.name)")
    }
}



// We can use classes as types in our functions
func printAnimalName (animal: Animal) {
    println("Animal's name is \(animal.name)")
}

// printAnimalName("Ena")
// this didn't work, so...

var doggie = Animal()
doggie.name = "Ena"
printAnimalName(doggie)

// Okay, I think because we set parameter as Animal, it told function we needed answer to both parameters
// Like instead of passing string, passing animal type

// so we have a totally separate function, but we referenced the Animal class, so now it is creating a separate instance of Animal, knows what parameters we need