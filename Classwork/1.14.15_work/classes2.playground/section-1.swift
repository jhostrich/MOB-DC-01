// Playground - noun: a place where people can play

import UIKit

class Vehicle {
    var wheels = 0
    var name: String = ""
    //this isn't good practice to have an empty string
    var color: String = ""
    var numberOfSeats = 0
    var numberOfAxels = 0
    
    
    func go() {
        println("Vroom vroom")
    }
    
    func inspectCar() {
        println("Your car has \(self.numberOfSeats) seats and \(self.numberOfAxels) axels.")
    }
    
    
    // Class method
    // There are classes (utility classes) that don't pertain to a specific instance/object--these can be used for dictionary definitions, etc
    // It's a method we create for a class
    class func aboutVehicles() {
        println("Cars are awesome")
    }
    
}

var myCar = Vehicle()
myCar.wheels = 4
myCar.name = "Car"
myCar.color = "Green"
myCar.numberOfSeats = 4
myCar.numberOfAxels = 2

myCar

myCar.inspectCar()

//Now I'll call the class method
Vehicle.aboutVehicles()

// instance methods can access instance variables
// class methods cannot access instance variables

// best practice is 1 class per file