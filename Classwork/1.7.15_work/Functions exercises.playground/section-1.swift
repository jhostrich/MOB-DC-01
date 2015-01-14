// Playground - noun: a place where people can play
// Lesson 05

// Complete these, in order, writing code under each TODO statement. Each statement calls for a function to be written, write each of them and then immediately call it after the function definition.

//--------------------------------------------------------------------

// TODO: Write a function that prints out "Hello world!" 10 times
func hello() {
    for index in 1...10 {
        println("Hello world")
    }
}

hello()



//--------------------------------------------------------------------

// TODO: Write a function that prints out "Hit this line {number of iterations of the loop} times!" 20 times

func hitLine(num: Int) {
    for index in 1...num {
        println("Hit this line \(num) times")
    }
}

hitLine(20)


//--------------------------------------------------------------------

// TODO: Write a function that accepts a string as a parameter. Print "Hello {value of string}!"
func helloYou(name: String) {
    println("Hello \(name)")
}

helloYou("Bob")



//--------------------------------------------------------------------

// TODO: Write a function accepts a string optional. If the string optional exists, print "Hello {value of string}!". If it doesn't, print "Hello world!"
func helloFriend(name: String?) {
    if name != nil {
        println("Hello \(name!)")
    } else {
        println("Hello world")
    }
}

helloFriend("Adam")
helloFriend(nil)


//--------------------------------------------------------------------

// TODO: Write a function that takes one parameter, n, and returns an integer, the nth series in the fibonacci sequence. The first fibonacci number is 0, the second is 1, the third is 1, the fourth is 2, fifth is 3, sixth is 5, etc. fibonacci numbers at sequence n are the sum of the n-1 and n-2 fibonacci number.

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

fibonacci(5)


//--------------------------------------------------------------------

// TODO: Write a function that calls the above function in order to print the sum of the first 20 fibonacci numbers.

func fibSum (n: Int) -> Int {
    var num = 0
    for index in 1...n {
        num += fibonacci(index)
    }
    return num
}

fibSum(20)



//--------------------------------------------------------------------

// TODO: Write a function that takes in a number and prints out whether it is prime, composite or neither.

func primeTest(num: Int) -> Bool {
    for index in 2...(num/2) {
        if num % index == 0 {
            return false
        }
    }
    return true
}


func prime(num: Int) {
    if num <= 1 {
        println("It's neither a composite nor a prime number")
    } else if primeTest(num) {
        println("It's a prime number")
    } else {
        println("It's a composite number")
    }
}
    
prime(21)


//--------------------------------------------------------------------

// TODO: Write a function that prints out each of the first 20 fibonacci numbers and whether they are prime. (e.g. 0 is not prime or composite, 1 is prime, etc)
/**/
func fibPrime(n: Int) {
    let num = fibonacci(n)
    for index in 1...n {
        prime(num)
    }
}


//--------------------------------------------------------------------

// TODO: Write a function that takes in two numbers, a bill amount and an optional tip percentage (represented as a float, e.g. .2 = 20% tip). Return a tuple with the total bill amount and the tip amount (if included).
func receipt (billAmount: Float, tipAmount: Float? = nil) -> (totalTip:Float, total:Float) {
    /*var pants: Float = 0
    if let percent = tipAmount {
        pants = percent * billAmount
    }
    
    return (billAmount + pants, pants)
    
    */
    
    if let tip = tipAmount {
        var totalTip = billAmount * tip
        var total = billAmount + totalTip
        return (totalTip, total)
    } else {
        return (0.0, billAmount)
    }
}




// = is the assignment operator
// == is the equivalence operator
/* There are arithmatic, assignment, and conditional operators
Arithmatic (+ - * / %) -- take 2 values and returning another value
Assignment (=) -- take what's on the right, and assign that value to what's on the left
Conditional (== <= >= < >  && ||) -- take 2 values and return true or false
*/

//--------------------------------------------------------------------

// TODO: Write a function that takes in a string and returns a string that is the reverse of the input. Append two strings using the + operator.



//--------------------------------------------------------------------

// BONUS TODO: Write a function that takes in an array of strings and a search term string. Return a boolean indicating whether the search term string exists in the array.


//--------------------------------------------------------------------

// BONUS TODO: Write a function that accepts a string and returns a boolean indicating whether a string is a palindrome (reads the same backwards or forwards).


//--------------------------------------------------------------------

// BONUS TODO: Write a function that takes in two strings and returns a boolean indicating whether the two strings match.
func doWordsMatch (x: String, y: String) -> Bool {
    if x == y {
        return true
    } else {
        return false
    }
// or just return x == y

}

doWordsMatch("Peter", "Wendy")


//--------------------------------------------------------------------

// BONUS TODO: Write a function that accepts two parameters, a string and a function that accepts a string and returns a string. Print the result of passing the string into the function 10 times.

