import UIKit


// -------------------------
// Dictionaries
// -------------------------

// First item is key, second is value
var wayneGretzky = ["first_name": "Wayne", "last_name": "Gretzky", "team": "Capitals"]

wayneGretzky["first_name"]

if let wayneName = wayneGretzky["first_name"] {
    println(wayneName)
}


// Declaring empty dictionary
// this is saying key is string, value is integer
var ena: [String: Int] = [:]

ena["legs"] = 4

ena["eyes"] = 2

// arrays are numbered, so can append
// dictionaries are just definitions, so not numbered/ordered

ena

// has to have default key and value


// setting value to nil will remove the key/value set from the dictionary entirely
ena["eyes"] = nil
ena

// so will this
ena.removeValueForKey("eyes")

// keys have to be strings, values have to be whatever type you set

// we always have to unwrap the value

ena["eyes"] = 2
ena

// we can change the value the same way
ena["eyes"] = 3

ena["paws"] = 4
ena

// if want an ordered dictionary, have to make an array of dictionaries
// no order to dictionaries! it's chaos!

// don't want to search by values--it's super slow
// always want to search by keys
// if wanting to search by values, should rethink the architecture of how the dictionary has been created


for (key, value) in ena {
    println("Ena has \(value) \(key)")
}


for enaKey in ena.keys {
    println(enaKey)
}

for enaValue in ena.values {
    println(enaValue)
}



/*

Array of dictionaries, like for Mashable

Article = [
    ["title: "...",
    "author: "...",
    "date: "..."],

    ["title: "...",
    "author: "...",
    "date: "..."]
]

*/


var articles = [
    ["title": "Ena breaks tail", "date": "02/23/15", "author": "Tedi"],
    ["title": "MOB class does Core Data", "date": "02/25/15", "author": "Arthur"]
]

articles[1]["title"]!

for article in articles {
    println(article["title"]!)
}

// can have more levels within levels of these, but we'll get to that later

// note: in real life, need to be checking for it existing (if conditionals)--don't assume it exists


/* 
--------------------------------------------
Persistent Data
--------------------------------------------
this is stuff the app remembers each time it's loaded
so you can set new data, it'll remember



-------------------------
User Defaults
-------------------------
basic default settings, maybe themes, high scores




-------------------------
Property Lists
-------------------------

written in XML, their root is arrays and dictionaries


user defaults should hold very little data

property lists can hold more, but still not too much
can't load just part of property list, have to load the whole damn thing
can actually get you rejected from app store :(

can't store complicated relations between things
arrays of sports fine, but can't do stuff with friends
no relational data

good for persisting lists, persisting collections of properties

not good for very large data sets, complex relations, sensitive data

NSUserDefaults is a property list that comes as default with your application

slightly more complex than user defaults

application data--can and should change


can store Strings, Numbers, Date, Data, Arrays, Dictionaries

best practice--no more than 200KB storage
we have to load all the info in a property list to access any of it, so it's not good for large files

good for flat storage

it's easy to convert Excel spreadsheets to plists, because they're XML

but by and large, it's best to use Core Date

*/

