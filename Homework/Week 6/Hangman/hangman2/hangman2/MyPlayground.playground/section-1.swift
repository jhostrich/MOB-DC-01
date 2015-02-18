// Playground - noun: a place where people can play

import UIKit


var alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]


var wrongGuesses: [String] = ["a"]
var correctGuesses: [String] = ["b"]
 var letter = "a"

if contains(wrongGuesses, letter) == true {
    println("Hurray")
}


//func determineBackgroundColor(letter: String) {
//    if contains (wrongGuesses, letter.lowercase) == true {
//        letterBtn.backgroundColor = UIColor.redColor()
//    } else if contains (correctGuesses, letter) == true {
//        letterBtn.backgroundColor = nil
//    } else {
//        letterBtn.backgroundColor = UIColor.purpleColor()
//    }
//}
