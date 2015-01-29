// Playground - noun: a place where people can play

import UIKit


// ---------- ARRAYS ----------

var myArray = [1, 4, 10, 15, 20]
// type inferred to be integers
// [] associated with arrays

var secondArray: [Int] = []
// this is an empty array--have to typecast an empty array

var stringArray: [String] = []
// check it! it's an empty string array

myArray[2]
// accessing the 3rd element in myArray--starts with 0, so 2 is for the third

myArray.first
myArray.last!

secondArray.first

secondArray.append(20)
secondArray
// append always adds element to the end
// append is a built-in method--this is why use (), not []

myArray.insert(100, atIndex: 2)
myArray.count
myArray.insert(50, atIndex: myArray.count - 1)
myArray.isEmpty
stringArray.isEmpty
myArray.removeAtIndex(2)
myArray[1] = 40
myArray

for i in myArray {
    if i == 40 {
        println("Bingo")
    } else {
        println("The value is \(i)")
    }
}



// ---------- TABLE VIEWS ----------
/*

tables take an array, put each item in a separate row
like the Settings app or Contacts app on iPhone

Section: All table views contain multiple sections
Row: Every section has a number of rows, which are entries in that section
Index path: The combination of a section and row that is a unique entry in a table view
Cell: The view that is displayed for an index path (the class UITableViewCell is a subclass of UIView)

size-> count, which is number of sections

in Contacts, A section, B section, etc
each section has many cells

tons of apps use table views--Twitter, Spotify, Mail
can add icons, images, descriptive subtext



MARK is a bookmark in code

*/


// ---------- DELEGATION ----------
/* 
implementation of a protocal
used for design patterns!

design patterns are common among all languages

protocols enable us to allow delegation

protocols can be optionals

The delegate is a relationship between 2 classes instances. One instance ha a delegate variable which refers to an instance that has certain methods (meets a protocol). This is the original class's trusted friend.


*/