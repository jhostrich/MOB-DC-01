import UIKit

protocol NewLetter {
    func addNewLetter(newLetter: String)
}


class SecondViewController: UIViewController {
    
    var delegate: NewLetter?
    var alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var letterBtn = UIButton()

    
    var wrongGuesses: [String] = ["a"]
    var correctGuesses: [String] = ["b"]

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createKeyboard()
    }

    
    // function to set x value for keyboard
    func determineKeyboardColumn(index: Int) -> Int {
        if index == 0 || index == 7 || index == 14 || index == 21 {
            return 10
        } else if index == 1 || index == 8 || index == 15 || index == 22 {
            return 60
        } else if index == 2 || index == 9 || index == 16 || index == 23 {
            return 110
        } else if index == 3 || index == 10 || index == 17 || index == 24 {
            return 160
        } else if index == 4 || index == 11 || index == 18 || index == 25 {
            return 210
        } else if index == 5 || index == 12 || index == 19 {
            return 260
        } else if index == 6 || index == 13 || index == 20 {
            return 310
        } else {
            return 0
        }
    }
    
    
    // function to set y value for keyboard
    func determineKeyboardRow(index: Int) -> Int {
        if index > 20 {
            return 300
        } else if index > 13 {
            return 250
        } else if index > 6 {
            return 200
        } else {
            return 150
        }
    }
    
    
    // to create keyboard buttons
    func createKeyboard() {
        for (index, letter) in enumerate(alphabet) {
            letterBtn = UIButton(frame: CGRect(x: determineKeyboardColumn(index), y: determineKeyboardRow(index), width: 40, height: 40))
            determineBackgroundColor(letter)
            letterBtn.setTitle("\(letter)", forState: .Normal)
            letterBtn.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
            addTargetConditional(letter)
            self.view.addSubview(letterBtn)
        }
    }
    
    // sets background color based on status
    func determineBackgroundColor(letter: String) {
        if contains (wrongGuesses, letter.lowercaseString) == true {
            letterBtn.backgroundColor = UIColor.redColor()
        } else if contains (correctGuesses, letter.lowercaseString) == true {
            letterBtn.backgroundColor = nil
        } else {
            letterBtn.backgroundColor = UIColor.whiteColor()
        }
    }

    
    // makes key clickable if it hasn't already been selected
    func addTargetConditional(letter: String) {
        if contains(wrongGuesses, letter.lowercaseString) == false && contains(correctGuesses, letter.lowercaseString) == false {
            letterBtn.addTarget(self, action: "pressedLetterKey:", forControlEvents: .TouchUpInside)
        }
    }
    
    
    // what happens when you press a letter key
    func pressedLetterKey (sender: UIButton) {
        let newLetter = sender.titleLabel?.text
        self.delegate?.addNewLetter(newLetter!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    // so I need to pass wrongGuesses and correctGuesses arrays to this view controller--I guess I could set up a delegate the other way

}
