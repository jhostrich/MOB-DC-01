// Playground - noun: a place where people can play

import UIKit

protocol Flight {

    // for an animal to be able to fly, it needs to have wings
    var wings: Bool { get set }
    // this is an override of the property, so usually will put both get and set
    
    var beakSize: Int { get set }
    var awesome: Bool { get set }
    
   // so if adhere to Flight protocol, must have canFly function, with Animal parameter, must return Bool
    //func canFly(animal: Animal) -> Bool
    
}


protocol Talk {
    func speak() -> String
}


// so we'll write class Penguin that adheres to protocol Flight
class Penguin: Flight {
    var wings = true
    var beakSize = 6
    var awesome = true
}

// what if want to make subclass of Animal, that follows protocol Flight
class Ostrich: Animal, Flight {
// or could be class Ostrich: Flight, Animal--order doesn't matter
    var wings = true
    var beakSize = 10
    var awesome = true
}

class Animal {
    var legs: Int
    var hasFur: Bool = false
    var hasClaws: Bool
    
    // this is because the hasClaws variable inside init() doesn't automatically connect to the hasClaws above
    // it could be init(randomVar: Bool)--but it's just good practice to give them the same name
    init(hasClaws: Bool) {
        self.hasClaws = hasClaws
        self.legs = 4
    }
    
    
    // it's usually best practice to declare values inside the init, not at the top when declaring variables
    // this is so if have subclass, they don't automatically inherit these variables
    
    // can have init function where doesn't require you put in an amount
    /*
    init() {
        println("Hello")
    }

    so maybe as soon as launch app, it does x, y, and z

    */
    
    
    func speak() {
        println("Hello world")
    }

}



class Human: Animal, Talk {
    func speak() -> String {
        return "Hello world"
    }
}


class Dog: Animal {
    
    // properties have 2 stages--set property, then read property
    // we have to be very specific when overriding properties
    // this is good to know, but we generally won't need to override properties
   /* override var hasFur: Bool {
        get {
            // return whatever the fur variable is set as
            return super.hasFur
            //if wanted to override the default and set to true
            return true
        }
        set {
            // override the inherited property to the new value set by the sub class
            super.hasFur = newValue    /* (newValue is a standard name, preset value we have access to) */
        }
    } */
    
    // this says add "Woof, woof" to function, don't replace it
    override func speak() {
        super.speak()
        println("Woof, woof")
    }

    // we can also override initializers and inherit properties from super classes
    // can user super. on anything
    // we'll go over all this later


}


var tedi = Animal(hasClaws: true)
var ena = Dog(hasClaws: true)
var skippy = ena
ena.legs
skippy.legs = 5
ena.legs
// check it out--it let us make ena = skippy (basically clone of ena), and then it remembered the connection later--as skippy changed, ena changed


/*

STRUCTS

1) Classes are reference types, while Structs are used for storing value types
2) Don't inherit
3) Structs aren't initialized automatically

so they're much less complex than classes, can't point to other things
like simpler classes

ViewControllers are all instances of class UIViewController

*/



struct Rectangle {
    var width: Int
    var height: Int
    
    func getArea() -> Int {
        return width * height
    }
}

// no default values in structs--we don't have to set up an init function


let myRectangle = Rectangle(width: 50, height: 100)

var myOtherRect = myRectangle
myOtherRect.width = 70
myRectangle.width
// check it out--we basically cloned myRectangle, but this new clone didn't affect myRectangle

//reverse value types--it doesn't do it


myRectangle.getArea()


// Structs good for self-contained value types
// are good for things like coordinates, shapes, etc

// if had house, could have door struct, and I think class House

struct Door {
    var width: Int
    var height: Int
    var x: Int
    var y: Int
}

// so here the door struct is set up kind of like a value type
class House {
    var door: Door
    init(door: Door) {
        self.door = door
    }
}




/*

POLYMORPHISM

whenever have the requirement of a class, can pass it's subclass

*/


// so here, needs an Animal, but it'll let me give a Dog
func doesAnimalHaveClaws(animal: Animal) -> Bool {
    return animal.hasClaws
}

let tedi2 = Animal(hasClaws: true)
doesAnimalHaveClaws((tedi2))



// so comment a lot! explain what's happening in all your code, so it's easy for you (and others) to follow


// Tedi and Thomas both say they mainly use classes over structs--default for them is classes




// PROTOCOLS

// they give us more structure and rules for our blueprints-they enforce rules for certain methods and properties
// our house must have doors, windows, etc
// protocols should go at very top of page, before class(es)

// they're good for when your programs get more complex, it helps us set the structure
// rules for our architecture

// don't usually get own file, go above a class or struct
// but don't need to put protocol above every class it applies to--can just have it once in the project, and the other classes will know what it is

// protocol is a bridge
// Protocol is like, yo, set up this info. Struct is the info.

// good for passing info between views and table views


// pattern for user protocol is called delegation





