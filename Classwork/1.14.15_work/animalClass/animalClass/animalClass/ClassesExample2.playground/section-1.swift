// Playground - noun: a place where people can play

import UIKit

// Core graphics is a great example of how initializers work
// UIView comes from UIKit, and it all comes from Core Graphics

var view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
// the Core Graphics rectangle requires us to enter coordinates and dimensions
view.backgroundColor = UIColor.purpleColor()
// background color is an object property
// UIColor purpleColor is a class method


class Animal2 {
    var name: String
    var legs: Int
    init (legs: Int, name: String) {
        self.legs = legs
        self.name = name
    }
    // Note--if want to initialize in subclass, have to add an extra step: we'll look at that later
    
    
    func speak() {
        println("AHHHHHH!")
    }
}



// this means we're inheriting from Animal2
class Dog: Animal2 {
    var isSmart = true
    override func speak() {
        println("Woof!")
    }
}


class Collie: Dog {
    
}


var doggie = Dog(legs: 4, name: "Ena")
doggie.legs
doggie.speak()
doggie.isSmart
doggie.isSmart = false
doggie.isSmart

var colliePup = Collie(legs: 4, name: "Lassie")
