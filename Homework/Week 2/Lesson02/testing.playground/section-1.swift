// Playground - noun: a place where people can play

import UIKit

class Greeting {
    var name = "world"
    var age: Int?
    
    func hello() -> String {
        if let ageCheck = age {
            return "Hello \(self.name), you are \(ageCheck) years old"
        } else {
            return "Hello \(name)"
        }
    }
    
    
    
    
}


var testing = Greeting()
testing.hello()
testing.age = 5
testing.name = "Bob"

testing.hello()






class AddNumbers {
    var entered: Int?
    init (entered: Int) {
        self.entered = entered
    }
    var sum = 0
    
    func addButtonClicks() -> Int {
        let tempVar = sum
        sum = tempVar + entered!
        return sum
    }
    
    func addButtonClicks2() -> Int {
        sum += entered!
        return sum
    }
    
    
    
}




var testing2 = AddNumbers(entered: 5)
testing2.addButtonClicks2()
testing2.addButtonClicks2()


func fibonacciNumberAtIndex(indexOfFibonacciNumber: Int) -> Int {
    var fibNum = indexOfFibonacciNumber, current = 0, next = 1, result = 0
    for index in 1...fibNum {
        let tempVar = current
        current = next
        next = tempVar + current
        result = tempVar
    }
    return result
    
    
}
fibonacciNumberAtIndex(21)


//   0 1 1 2 3 5 8



func fibonacci (n: Int) -> Int {
    var fibNum = n, current = 0, next = 1, result = 0
    for index in 0..<fibNum {
        let tempVar = current
        current = next
        next = tempVar + current
        result = tempVar
    }
    return result
}
fibonacci(21)