import UIKit

protocol NewLetter {
    func addNewLetter(newLetter: String)
}


class SecondViewController: UIViewController {
    
    var delegate: NewLetter?
    var alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var letterBtn = UIButton()
    var buttons = [UIButton]()
    var correctGuesses:[String] = [] {
        didSet {
            formatButtons()
        }
    }

    
    var wrongGuesses: [String] = ["a"]

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createKeyboard()
    }
    
    func formatter() {
        for var i = 0; i < self.correctGuesses.count; i++ {
            println("\(self.correctGuesses[i])")
        }
    }

    
    // function to set x value for keyboard
    func determineKeyboardColumn(index: Int) -> Int {
        if index % 7 == 0 {
            return 10
        } else if index % 7 == 1 {
            return 60
        } else if index % 7 == 2 {
            return 110
        } else if index % 7 == 3 {
            return 160
        } else if index % 7 == 4 {
            return 210
        } else if index % 7 == 5 {
            return 260
        } else if index % 7 == 6 {
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
            letterBtn.setTitle("\(letter)", forState: .Normal)
            letterBtn.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
            addTargetConditional(letter)
            self.view.addSubview(letterBtn)
            
            self.buttons.append(letterBtn)
        }
        
        formatButtons()
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
    
    func formatButtons() {
        for button in self.buttons {
            if (contains(self.correctGuesses, button.titleLabel!.text!)) {
                button.backgroundColor = UIColor.greenColor()
            }
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
