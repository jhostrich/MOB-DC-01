// Playground - noun: a place where people can play

import UIKit

// this is so we can do asynchronous stuff in playground--we won't need to do this in other types of files
import XCPlayground


// Let asynchronous code run
XCPSetExecutionShouldContinueIndefinitely()

let url = NSURL(string: "http://tedi.io")

// if let url = NSURL(string: "http://tedi.io")--this checks if it's a valid url

let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
    // data, response, and error are just variables we pass in a function, so we could call them whatever we want
    // but data, response, and error are what we're referring to, so good to call them this

    // our data is being passed through a function--it's called a closure--we can pass functions through functions
    // we can pass functions as parameters into functions
    // so basically, pass data, and once get this data, function runs--and we can have multiple functions run, all through closures
    // Swift comes with some closures built in--arrays have closure methods such as map, filter

    // the "Void in" basically means once data loads, do this function

    println(data)
    println(response)
    println(error)
})

task.resume()
// we have to resume--it won't fire until we hit resumse



// good to know--playground isn't a great place to try out networking--it's buggy

// data is data--it's a bunch of bytes
// response is the meta
// error just lets you know if there's an error