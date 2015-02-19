import UIKit

protocol NewLetter {
    func addNewLetter(newLetter: String)
}


class SecondViewController: UIViewController {
    
    var delegate: NewLetter?
    var alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    // This variable will be used to make letter buttons
    var letterBtn = UIButton()
    
    // This array will be used for formatting buttons
    var buttons: [UIButton] = []
    
    // Correct guesses passed from first VC—-will be used to format buttons
    var correctGuesses:[String] = [] {
        didSet {
            formatButtons()
        }
    }
    
    // Wrong guesses passed from first VC—-will be used to format buttons
    var wrongGuesses: [String] = [] {
        didSet {
            formatButtons()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createKeyboard()
    }

    
    // TO CREATE KEYBOARD BUTTONS--this is the main function in this VC
    func createKeyboard() {
        for (index, letter) in enumerate(alphabet) {
            letterBtn = UIButton(frame: CGRect(x: determineKeyboardColumn(index), y: determineKeyboardRow(index), width: 40, height: 40))
            letterBtn.setTitle("\(letter)", forState: .Normal)
            letterBtn.titleLabel!.font = UIFont(name: "Avenir Next", size: 20.0)
            letterBtn.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
            self.view.addSubview(letterBtn)
            
            self.buttons.append(letterBtn)
        }
        
        formatButtons()
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
    
    
    // Sets button appearance--correct is no BGColor, wrong is red BGColor, unclicked is white BGColor plus clickable
    func formatButtons() {
        for button in self.buttons {
            if (contains(self.correctGuesses, button.titleLabel!.text!)) {
                button.backgroundColor = nil
            } else if (contains(self.wrongGuesses, button.titleLabel!.text!)) {
                button.backgroundColor = UIColor(red: 254/255, green: 169/255, blue: 169/255, alpha: 1.0)
            } else {
                button.backgroundColor = UIColor.whiteColor()
                button.addTarget(self, action: "pressedLetterKey:", forControlEvents: .TouchUpInside)
            }
        }
    }
    
    
    // what happens when you press a letter key
    func pressedLetterKey (sender: UIButton) {
        let newLetter = sender.titleLabel?.text
        self.delegate?.addNewLetter(newLetter!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
