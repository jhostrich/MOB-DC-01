// Lesson 04 playground

import Foundation

// TODO: Create two variables, name and age. Name is a string, age is an integer.
var myName = "Johanna"
var myAge = 30


// TODO: Print "Hello {whatever the value of name is}, you are {whatever the value of age is} years old!"
println("Hello \(myName), you are \(myAge) years old!")


// TODO: Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
if myAge > 21 {
    println("You can drink")
} else if myAge > 18 {
    println("You can vote")
} else if myAge > 16 {
    println("You can drive")
}


// TODO: Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
if myAge > 16 && myAge < 18{
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


// TODO: Create a constant called number
let number = 3


// TODO: Print whether the above number is even
if number % 2 == 0 {
    println("It's even")
} else if number % 2 == 1 {
    println("It's odd")
}


// TODO: The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number. Print the 37th fibonacci number below
/*
0, 1, 1, 2, 3, 5

var x = 0
var y = 1
var z = x + y

for g = 37 {
    println()
}


*/


// TODO: Print out "Hello {whatever the value of name is}, your name is {however long the string name is} characters long!. Use countElements()
println("Hello \(myName), your name is \(countElements(myName)) characters long!")


// TODO: Print the sum of one hundred random numbers. Use rand() to generate random numbers.


// Bonus TO DO: Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”.
var w: Int
for w in 1...100 {
    println(w)
}


//tuple is an array with multiple types