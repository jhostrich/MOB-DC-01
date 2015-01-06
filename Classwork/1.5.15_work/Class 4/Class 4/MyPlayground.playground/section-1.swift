// Playground - noun: a place where people can play


import UIKit


/* This is a comment block
 * Can do this to look snazzy
*/


//Strings are usually presented in double quotes (words in quotation)

"This is a string. 8 is a number in a string"

//Integers are whole numbers

5
8
10000000000


//Doubles and floats—difference has something to do with how many decimals (double has more decimal points, more accurate, so go with double unless have reason not to), but both will show non-whole numbers
54.76


//Boolean is a true or false statement
true
false


//Type inference—Swift knows what kind of data
//everything is case sensitive

/*

Collections:
array—linear collection of data

dictionaries—defines, will cover more later

*/

//Variables are mutable (you can change them)



//var myVariable
//camel-case is preferred method for names, best practice

var myVariable = "Hello world"

println(myVariable)

var mySecondVariable: String = "Hello world again"
mySecondVariable = "10"

/* We've told computer that mySecondVariable is a String, so it will get mad if try to put integer in 
"10" okay, because a string
10 not okay
*/



// command + / comments out a line, or a block if it's selected, do it again to uncomment


var x = 10
var y = 4

x + y
x - y
x * y
x / y
//Not getting remainder because inferred type of variables is an integer


x % y
//This means remainder (called modulus), so 4 goes into 10 twice, with remainder of 2


y = 20
println(y)

// Error messages aren't scary, they're helpful hints

x / y

//Number Variables must be defined as integer, double, or float; if not defined, automatically integer

// Constants (immutable—means you can't change them)
let myName = "Johanna"
//myName = "John" will error out because constants are immutable


//Optional
var amIHere: String? = "Yes"
println(amIHere)

println(amIHere!)
//Here we unwrapped the optional with the !

/* This can be useful if lots of complex data coming back, don't want it to crash if data doesn't fit (or something like that)

nil means no data, so can have conditional surrounding

*/


var whatsUp: String?
println(whatsUp)
//println(whatsUp!)
//I get an error, because I can't unwrap a nil


/* Could have a circumstance where haev constant as optional
let myLastName: String?
but it would be weird not to declare the string*/
let myLastName: String? = "Ostrich"
//is okay


//Type: What a variable/constant is, ie String, Integer, etc
//Type inference--it assumes what the type is



/******************** Control Flow ************************/
/*
Loops--keeps happening until a certain point
Conditional--something happens under certain conditions

we can have conditionals in loops and loops in conditionals

== checks for equality

*/


/*** First, Conditionals ***/

if (y == 4){
    println("5 is 5")
    println("Another line of code")
}

if (y == 20){
    println("5 is 5")
    println("Another line of code")
}

//Stick cursor next to y, and it highlights spot on page where y variable was last set (yay!)

var myAge = 22
if myAge < 21 {
    println("You can't get in!")
}
else if myAge == 21 {
    println("Free drinks!")
}
else if myAge > 21 && myAge < 25 {
    println("You can drink but you can't rent a car")
}
else {
    println("You can party!")
}


//  == equal to
//  <= less than or equal to
//  >= greater than or equal to
//  != not equal to


//Once a condition is met, the function stops running (not sure it's called a function though)
//Conditional statements run when something is true. Or whenever a condition is true, it runs.

//Switch statement is alternative to If statement. We'll go over this later.

//can have if statements within if statements, but don't do that--it's crappy code


/*** Loops ***/


// for initialization; condition; increment
for var i = 0; i < 5; ++i {
    println("Code is running")
}
// ++ means increment up by 1

//Interpolation--lets us insert variables within our strings
for var i = 1; i < 5; ++i {
    println("Code is running \(i)")
}


for index in 1...5 {
    println(index)
}

//index is where we are in a countdown, our location in the countdown


var k = 1
while k < 10 {
    println("counting")
    ++k
}

println(k)


// while statements have more flexibility




