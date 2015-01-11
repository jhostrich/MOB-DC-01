// Lesson 04 playground

import Foundation

// TODO: Create two variables, name and age. Name is a string, age is an integer.
var myName = "Johanna"
var myAge = 30


// TODO: Print "Hello {whatever the value of name is}, you are {whatever the value of age is} years old!"
println("Hello \(myName), you are \(myAge) years old!") //Interpolation
"This is " + "concatenation"


// TODO: Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
if myAge > 21 {
    println("You can drink")
} else if myAge > 18 {
    println("You can vote")
} else if myAge > 16 {
    println("You can drive")
}


// TODO: Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
if myAge > 16 && myAge < 18 {
    println("You can drive")
} else if myAge > 18 && myAge < 21 {
    println("You can drive and vote")
} else if myAge > 21 {
    println("You can drive, vote, and drink (but not at the same time!)")
}


// TODO: Print the first fifty multiples of seven minus one (e.g. the first three multiples are 7, 14, 21. The first three multiples minus one are 6, 13, 20)
var h: Int
for h in 1...50 {
    println(h * 7 - 1)
}

/* Scoping 

for i in 1...50 {
    var multiple = 7 * i - 1
    println(multiple)
}

multiple is only valid inside the brackets here

*/

for var i = 0; i < 50; ++i {
    println(7*i-1)
}



// TODO: Create a constant called number
let number = 3


// TODO: Print whether the above number is even
if number % 2 == 0 && number != 0 {
    println("It's even")
} else if number % 2 == 1 {
    println("It's odd")
}


// TODO: The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number. Print the 37th fibonacci number below

var x1 = 0, x2 = 1
//note can define multiple variables at once like this--shorthand!

//anyway:
var fibNum = 37, current = 0, next = 1, result = 0
for index in 0..<fibNum {
    //current val is 3
    //temp val becomes 3
    let tempVar = current
    //current value becomes next (5)
    current = next
    //next value becomes old current (temporary) + new current (old next)
    next = tempVar + current
    result = tempVar
}
println("Fib num is \(result)")


// for For Loops, have to declare variable in advance
// for For In Loops, don't have to declare variable, since it's a temporary variable
// constants are technically more memory-light than variables, though it doesn't make a huge difference


// TODO: Print out "Hello {whatever the value of name is}, your name is {however long the string name is} characters long!. Use countElements()
println("Hello \(myName), your name is \(countElements(myName)) characters long!")


// TODO: Print the sum of one hundred random numbers. Use rand() to generate random numbers.
var sum = 0
for i in 1...100 {
    sum += Int(rand())
    //here, we typecast it as an integer
}
println(sum)

//var sum = 20
//sum = sum + 10
//sum += 10 means the same thing


println(sum)
var tempString = "10"
tempString.toInt()!


var sumB = 0
for i in 1...100 {
    sumB += String(rand()).toInt()!
}
println(sum)
//I think the issue here is rand() is for something other than integers, so we have to make it an integer before it will work


// Bonus TO DO: Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”.
let fizz = 3
let buzz = 5

for var i = 1; i <= 100; ++i {
    if ((i % fizz) == 0 && (i % buzz) == 0) {
        println("FizzBuzz")
    }
    else if ((i % fizz) == 0) {
        println("Fizz")
    }
    else if ((i % buzz) == 0) {
        println("Buzz")
    }
    else {
        println("Number \(i)")
    }
}

//tuple is an array with multiple types
