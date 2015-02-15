import UIKit

class FirstViewController: UIViewController {
    
    var myPhrase = ["l", "u", "k", "e", "i", "a", "m", "y", "o", "u", "r", "f", "t", "h"]
    var wrongGuesses: [String] = []
    var correctGuesses: [String] = []
    var incompleteWord = ""
    
    /*if myWord.lowercaseString.rangeOfString("e") != nil {
    
    }
    
    
    for letter in myWord {
    if contains(correctGuesses, String(letter).lowercaseString) {
    incompleteWord += String(letter)
    incompleteWord += " "
    } else {
    incompleteWord += "_ "
    }
    }
    
    
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

/*


Okay, so what are the steps I need to take?

so I need to set the phrase, then set a correct guesses array
so let's say my phrase is "Luke I am your father"
var correctGuesses = ["l", "u", "k", "e", "i", "a", "m", "y", "o", "u", "r", "f", "t", "h"]

use for loop to write the word out, make sure can get spaces between words in there

add letter--> goes to next view

in KeyboardViewController
hit key, that key represents that letter--not sure how that will work--I think button.text will be the letter

when hit key, several things happen:
- the key changes--if correct, green, or loses background
if incorrect, red
- passes 2 things back--the letter, and if the letter is correct or incorrect
- if incorrect, draws another part of hangman, plus # of wrong guesses label changes
- if correct, letter is revealed

- also needs to listen for gameOverGood and gameOverBad

- when drawing hangman, need to pay attention to autolayout, so this will need to be drawn programmatically



so I think the first step is to set up ViewController
- make sure that the revealing of letters is working properly
- then can move onto KeyboardViewController

will have to see if the keyboard idea will work--might be too much for now
possible issues are:
- the Keyboard will need to remember it's right/wrong settings--do I know how to do that?
- might get tricky with so many buttons, but again, I think the button.text will work
- will just have to see

- okay, I think the keyboard vc won't remember things, so I'll have to pass the info each time:
like a variable for unused, correct, and wrong
and will render key in certain way depending on which one

Adam suggests creating the keyboard buttons programmatically
this is a good idea, because it will generate the appearance settings for me

*/
