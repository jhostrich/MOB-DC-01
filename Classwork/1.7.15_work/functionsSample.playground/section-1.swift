// Playground - noun: a place where people can play

import UIKit

func hello() {
    println("Hello world")
}

hello()

//parameter is a temporary variable, it's only available within the function

func sum(firstNum: Int, secondNum: Int) {
    firstNum + secondNum
    secondNum - firstNum
}

sum (10, 10)

// "-> Int" is saying want integer result
func sumB(firstNum: Int, secondNum: Int) -> Int {
    let newSum = firstNum + secondNum
    return newSum
}

sumB (10, 10)
sumB (20, 10)
//so now returning the result to us


func sumC(firstNum: Int, secondNum: Int) -> Int {
    let newSum = firstNum + secondNum
    return newSum
}

var x = sumC(10, 20)
var y = sumC(x, 15)

//you can call functions within functions! Huzzah!
/*
func sumC(firstNum: Int, secondNum: Int) -> Int {
    let newSum = firstNum + secondNum
    hello()
    return newSum
}

var x = sumC(10, 20)
var y = sumC(x, 15)
*/



//--------------Fibonacci function------------------


func fib(place: Int) -> Int {
    var fibNum = place, current = 0, next = 1, result = 0
    for index in 0..<fibNum {
        let tempVar = current
        current = next
        next = tempVar + current
        result = tempVar
    }
    
    return result
}

fib(6)
fib(9)



//can add external variable (fibPlace) to help us remember what the internal variable (place) is
func fibB(fibPlace place: Int) -> Int {
    var fibNum = place, current = 0, next = 1, result = 0
    for index in 0..<fibNum {
        let tempVar = current
        current = next
        next = tempVar + current
        result = tempVar
    }
    
    return result
}

fibB (fibPlace: 9)

// better to have internal and external variables have same name--more clear, but not very dry, so could do #place (declares both)



func fibC(place: Int?) -> Int {
    var fibNum = place!, current = 0, next = 1, result = 0
    for index in 0..<fibNum {
        let tempVar = current
        current = next
        next = tempVar + current
        result = tempVar
    }
    
    return result
}

var q = 8
fib (10)


// great way to unwrap optionals
var num: Int? = 5
num!

if let numValue = num {
    println(numValue + 5)
}
//this is basically saying if num is a value (ie not nil), then do something
//so if it's nil, it won't do anything

//optionals are a way to deal with errors/crash, since you're dealing with data that doesn't exist
//optionals say hey, no stress, if nothing gets returned, do x
//let us fail safely

num
// "Some 5" means there's some value that is called 5--it doesn't know what it is, it's type, etc, just knows that it's not nil
// once you unwrap it, it recognizes it as an Int again

num!


func save(name: String) -> (first: String, last: String) {
    var lastName = "Ostrich"
    return (name, lastName)
}
//tuple (pronounced "toople") has multiple values

var myName = save("Johanna")
myName.first
myName.last

//when functions return more than 1 thing, we can call just a single result with .XXXXX






