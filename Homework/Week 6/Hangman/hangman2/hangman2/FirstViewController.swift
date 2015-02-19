import UIKit

class FirstViewController: UIViewController, NewLetter {
    
    var myPhrase = "Luke I am your father"
    var wrongGuesses: [String] = []
    var correctGuesses: [String] = []
    var incompleteWord = ""
    var phraseLabel = UILabel()
    var gameOverMsg = UILabel()
    var addButton = UIBarButtonItem()
    
    
    // Hangman parts--declaring now so can reference each other in different functions
    var gallowsTop = UIView()
    var gallowsPost = UIView()
    var gallowsBase = UIView()
    var noose = UIView()
    var head = UIView()
    var body = UIView()
    var leftArm = UIView()
    var rightArm = UIView()
    var leftLegUpper = UIView()
    var leftLegLower = UIView()
    var rightLegUpper = UIView()
    var rightLegLower = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton = UIBarButtonItem(title: "Add Letter", style: UIBarButtonItemStyle.Plain, target: self, action: "guessLetterButton:")
        self.navigationItem.rightBarButtonItem = addButton

        NSNotificationCenter.defaultCenter().addObserver(self,
                                            selector: "handleGameOver:",
                                            name: "gameOver",
                                            object: nil)
        
        createPhraseLabel()
        drawHangman()
    }

    
    // ----- ADD BAR BUTTON -----
    func guessLetterButton(sender: AnyObject) {
        var secondVC = self.storyboard?.instantiateViewControllerWithIdentifier("secondVC") as SecondViewController
        
        // To pass correctGuesses and wrongGuesses arrays to secondVC
        secondVC.correctGuesses = self.correctGuesses
        secondVC.wrongGuesses = self.wrongGuesses
        
        var navigationController = UINavigationController(rootViewController: secondVC)
        secondVC.delegate = self
        self.presentViewController(navigationController, animated: true, completion: nil)
    }

    
    // ----- PHRASE LABEL -----
    func createPhraseLabel() {
        phraseLabel.text = writeOutAnswer(myPhrase)
        phraseLabel.font = UIFont(name: "Avenir Next", size: 28.0)
        phraseLabel.numberOfLines = 0
        self.view.addSubview(phraseLabel)
        phraseLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
    
        // - Phrase Label Leading -
        let phraseLabelLeading = NSLayoutConstraint(
            item: phraseLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 20.0)
    
        // - Phrase Label Trailing -
        let phraseLabelTrailing = NSLayoutConstraint(
            item: phraseLabel,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: -20.0)
    
        // - Phrase Label Height -
        let phraseLabelHeight = NSLayoutConstraint(
            item: phraseLabel,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1.0,
            constant: 100.0)
    
        // - Phrase Label Vertical Positioning -
        let phraseLabelVerticalPosition = NSLayoutConstraint(
            item: phraseLabel,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: -20.0)
        
        self.view.addConstraints([phraseLabelLeading, phraseLabelTrailing, phraseLabelVerticalPosition, phraseLabelHeight])
    }
    
    
    // ----- CHECKS IF NEW LETTER IS CORRECT OR INCORRECT -----
    func addNewLetter(newLetter: String) {
        if myPhrase.lowercaseString.rangeOfString(newLetter.lowercaseString) != nil {
            self.correctGuesses.append(newLetter)
        } else {
            self.wrongGuesses.append(newLetter)
        }
        
        createPhraseLabel()
        drawHangman()
    }

    
    // ----- GENERATES TEXT IN PHRASE LABEL -----
    func writeOutAnswer(myPhrase: String) -> String {
        incompleteWord = ""
        for letter in myPhrase {
            if contains(self.correctGuesses, String(letter).uppercaseString) {
                incompleteWord += String(letter).uppercaseString
                incompleteWord += " "
            } else if letter == " " {
                incompleteWord += "   "
            } else {
                incompleteWord += "_ "
            }
        }
        checkForWin(incompleteWord)
        return incompleteWord
    }
    
    
    // ----- DRAWING HANGMAN --------------------------------------------------------
    
    // ----- First part: Gallows and noose -----
    func draw1Part() {
        
        // --- Gallows Top ---
        gallowsTop.backgroundColor = UIColor.darkGrayColor()
        self.view.addSubview(gallowsTop)
        gallowsTop.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Gallows Top Height -
        let gallowsTopHeight = NSLayoutConstraint(
            item: gallowsTop,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 2)
        
        // - Gallows Top Width -
        let gallowsTopWidth = NSLayoutConstraint(
            item: gallowsTop,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 50)
        
        // - Gallows Top Leading -
        let gallowsTopLeading = NSLayoutConstraint(
            item: gallowsTop,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1,
            constant: 40)
        
        // - Gallows Top Vertical Position -
        let gallowsTopVerticalPosition = NSLayoutConstraint(
            item: gallowsTop,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: 80)

        self.view.addConstraints([gallowsTopHeight, gallowsTopWidth, gallowsTopLeading, gallowsTopVerticalPosition])
        
        
        // --- Gallows Post ---
        gallowsPost.backgroundColor = gallowsTop.backgroundColor
        self.view.addSubview(gallowsPost)
        gallowsPost.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Gallows Post Height -
        let gallowsPostHeight = NSLayoutConstraint(
            item: gallowsPost,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 150)
        
        // - Gallows Post Width -
        let gallowsPostWidth = NSLayoutConstraint(
            item: gallowsPost,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 2)
        
        // - Gallows Post Leading -
        let gallowsPostLeading = NSLayoutConstraint(
            item: gallowsPost,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: gallowsTop,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1,
            constant: 0)
        
        // - Gallows Post Vertical Position -
        let gallowsPostVerticalPosition = NSLayoutConstraint(
            item: gallowsPost,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: gallowsTop,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: 0)
        
        self.view.addConstraints([gallowsPostHeight, gallowsPostWidth, gallowsPostLeading, gallowsPostVerticalPosition])
        
        
        // --- Gallows Base ---
        gallowsBase.backgroundColor = gallowsTop.backgroundColor
        self.view.addSubview(gallowsBase)
        gallowsBase.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Gallows Base Height -
        let gallowsBaseHeight = NSLayoutConstraint(
            item: gallowsBase,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 2)
        
        // - Gallows Base Width -
        let gallowsBaseWidth = NSLayoutConstraint(
            item: gallowsBase,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 42)
        
        // - Gallows Base Leading -
        let gallowsBaseLeading = NSLayoutConstraint(
            item: gallowsBase,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: gallowsPost,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1,
            constant: -20)
        
        // - Gallows Base Vertical Position -
        let gallowsBaseVerticalPosition = NSLayoutConstraint(
            item: gallowsBase,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: gallowsPost,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0)
        
        self.view.addConstraints([gallowsBaseHeight, gallowsBaseWidth, gallowsBaseLeading, gallowsBaseVerticalPosition])

        
        // --- Noose ---
        noose.backgroundColor = gallowsTop.backgroundColor
        self.view.addSubview(noose)
        noose.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Noose Height -
        let nooseHeight = NSLayoutConstraint(
            item: noose,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 15)
        
        // - Noose Width -
        let nooseWidth = NSLayoutConstraint(
            item: noose,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 1)
        
        // - Noose Leading -
        let nooseLeading = NSLayoutConstraint(
            item: noose,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: gallowsTop,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1,
            constant: -1)
        
        // - Noose Vertical Position -
        let nooseVerticalPosition = NSLayoutConstraint(
            item: noose,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: gallowsTop,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0)
        
        self.view.addConstraints([nooseHeight, nooseWidth, nooseLeading, nooseVerticalPosition])

    }
    
    
    // ----- Second part: Head -----
    func draw2Parts() {
        
        draw1Part()
        
        // --- Head ---
        head.layer.borderColor = UIColor.darkGrayColor().CGColor
        head.layer.borderWidth = 2
        head.layer.cornerRadius = 15
        self.view.addSubview(head)
        head.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Head Height -
        let headHeight = NSLayoutConstraint(
            item: head,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 30)
        
        // - Head Width -
        let headWidth = NSLayoutConstraint(
            item: head,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 30)
        
        // - Head Leading -
        let headLeading = NSLayoutConstraint(
            item: head,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: noose,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1,
            constant: -15)
        
        // - Head Vertical Position -
        let headVerticalPosition = NSLayoutConstraint(
            item: head,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: noose,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0)
        
        self.view.addConstraints([headHeight, headWidth, headLeading, headVerticalPosition])
    }
    
    
    // ----- Third part: Body -----
    func draw3Parts() {
        
        draw2Parts()
        
        // --- Body ---
        body.backgroundColor = gallowsTop.backgroundColor
        self.view.addSubview(body)
        body.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Body Height -
        let bodyHeight = NSLayoutConstraint(
            item: body,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 50)
        
        // - Body Width -
        let bodyWidth = NSLayoutConstraint(
            item: body,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 2)
        
        // - Body Leading -
        let bodyLeading = NSLayoutConstraint(
            item: body,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: head,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1,
            constant: 15)
        
        // - Body Vertical Position -
        let bodyVerticalPosition = NSLayoutConstraint(
            item: body,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: head,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0)
        
        self.view.addConstraints([bodyHeight, bodyWidth, bodyLeading, bodyVerticalPosition])
    }

    
    // ----- Fourth part: Left Arm -----
    func draw4Parts() {
        
        draw3Parts()
        
        // --- Left Arm ---
        leftArm.backgroundColor = gallowsTop.backgroundColor
        self.view.addSubview(leftArm)
        leftArm.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Left Arm Height -
        let leftArmHeight = NSLayoutConstraint(
            item: leftArm,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 2)
        
        // - Left Arm Width -
        let leftArmWidth = NSLayoutConstraint(
            item: leftArm,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 20)
        
        // - Left Arm Trailing -
        let leftArmTrailing = NSLayoutConstraint(
            item: leftArm,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1,
            constant: 0)
        
        // - Left Arm Vertical Position -
        let leftArmVerticalPosition = NSLayoutConstraint(
            item: leftArm,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: head,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 15)
        
        self.view.addConstraints([leftArmHeight, leftArmWidth, leftArmTrailing, leftArmVerticalPosition])
    }

    
    // ----- Fifth part: Right Arm -----
    func draw5Parts() {
        
        draw4Parts()
        
        // --- Right Arm ---
        rightArm.backgroundColor = gallowsTop.backgroundColor
        self.view.addSubview(rightArm)
        rightArm.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Right Arm Height -
        let rightArmHeight = NSLayoutConstraint(
            item: rightArm,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: leftArm,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 0)
        
        // - Right Arm Width -
        let rightArmWidth = NSLayoutConstraint(
            item: rightArm,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: leftArm,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 0)
        
        // - Right Arm Leading -
        let rightArmLeading = NSLayoutConstraint(
            item: rightArm,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1,
            constant: 0)
        
        // - Right Arm Vertical Position -
        let rightArmVerticalPosition = NSLayoutConstraint(
            item: rightArm,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: head,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 15)
        
        self.view.addConstraints([rightArmHeight, rightArmWidth, rightArmLeading, rightArmVerticalPosition])
    }

    
    // ----- Sixth part: Left Leg -----
    func draw6Parts() {
        
        draw5Parts()
        
        // --- Left Leg Upper ---
        leftLegUpper.backgroundColor = gallowsTop.backgroundColor
        self.view.addSubview(leftLegUpper)
        leftLegUpper.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Left Leg Upper Height -
        let leftLegUpperHeight = NSLayoutConstraint(
            item: leftLegUpper,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 2)
        
        // - Left Leg Upper Width -
        let leftLegUpperWidth = NSLayoutConstraint(
            item: leftLegUpper,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 5)
        
        // - Left Leg Upper Trailing -
        let leftLegUpperTrailing = NSLayoutConstraint(
            item: leftLegUpper,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1,
            constant: 0)
        
        // - Left Leg Upper Vertical Position -
        let leftLegUpperVerticalPosition = NSLayoutConstraint(
            item: leftLegUpper,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: -2)
        
        self.view.addConstraints([leftLegUpperHeight, leftLegUpperWidth, leftLegUpperTrailing, leftLegUpperVerticalPosition])
        
        // --- Left Leg Lower---
        leftLegLower.backgroundColor = gallowsTop.backgroundColor
        self.view.addSubview(leftLegLower)
        leftLegLower.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Left Leg Lower Height -
        let leftLegLowerHeight = NSLayoutConstraint(
            item: leftLegLower,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 35)
        
        // - Left Leg Lower Width -
        let leftLegLowerWidth = NSLayoutConstraint(
            item: leftLegLower,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 2)
        
        // - Left Leg Lower Trailing -
        let leftLegLowerTrailing = NSLayoutConstraint(
            item: leftLegLower,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: leftLegUpper,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1,
            constant: 0)
        
        // - Left Leg Lower Vertical Position -
        let leftLegLowerVerticalPosition = NSLayoutConstraint(
            item: leftLegLower,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: leftLegUpper,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: 0)
        
        self.view.addConstraints([leftLegLowerHeight, leftLegLowerWidth, leftLegLowerTrailing, leftLegLowerVerticalPosition])

    }

    
    // ----- Seventh part: Right Leg -----
    func draw7Parts() {
        
        draw6Parts()
        
        // --- Right Leg Upper ---
        rightLegUpper.backgroundColor = gallowsTop.backgroundColor
        self.view.addSubview(rightLegUpper)
        rightLegUpper.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Right Leg Upper Height -
        let rightLegUpperHeight = NSLayoutConstraint(
            item: rightLegUpper,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: leftLegUpper,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 0)
        
        // - Right Leg Upper Width -
        let rightLegUpperWidth = NSLayoutConstraint(
            item: rightLegUpper,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: leftLegUpper,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 0)
        
        // - Right Leg Upper Leading -
        let rightLegUpperLeading = NSLayoutConstraint(
            item: rightLegUpper,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1,
            constant: 0)
        
        // - Right Leg Upper Vertical Position -
        let rightLegUpperVerticalPosition = NSLayoutConstraint(
            item: rightLegUpper,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: -2)
        
        self.view.addConstraints([rightLegUpperHeight, rightLegUpperWidth, rightLegUpperLeading, rightLegUpperVerticalPosition])
        
        
        // --- Right Leg Lower---
        rightLegLower.backgroundColor = gallowsTop.backgroundColor
        self.view.addSubview(rightLegLower)
        rightLegLower.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Right Leg Lower Height -
        let rightLegLowerHeight = NSLayoutConstraint(
            item: rightLegLower,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: leftLegLower,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 0)
        
        // - Right Leg Lower Width -
        let rightLegLowerWidth = NSLayoutConstraint(
            item: rightLegLower,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: leftLegLower,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 0)
        
        // - Right Leg Lower Leading -
        let rightLegLowerLeading = NSLayoutConstraint(
            item: rightLegLower,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: rightLegUpper,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1,
            constant: 0)
        
        // - Right Leg Lower Vertical Position -
        let rightLegLowerVerticalPosition = NSLayoutConstraint(
            item: rightLegLower,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: rightLegUpper,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: 0)
        
        self.view.addConstraints([rightLegLowerHeight, rightLegLowerWidth, rightLegLowerLeading, rightLegLowerVerticalPosition])
        
    }

    
    func drawHangman() {
        if wrongGuesses.count == 7 {
            draw7Parts()
            NSNotificationCenter.defaultCenter().postNotificationName("gameOver", object: nil)
        } else if wrongGuesses.count == 6 {
            draw6Parts()
        } else if wrongGuesses.count == 5 {
            draw5Parts()
        } else if wrongGuesses.count == 4 {
            draw4Parts()
        } else if wrongGuesses.count == 3 {
            draw3Parts()
        } else if wrongGuesses.count == 2 {
            draw2Parts()
        } else if wrongGuesses.count == 1 {
            draw1Part()
        }
    }
    
    // ----- LOOKING OUT FOR A WIN -----
    func checkForWin(incompleteWord: String) {
        if incompleteWord.lowercaseString.rangeOfString("_") == nil {
            NSNotificationCenter.defaultCenter().postNotificationName("gameOver", object: nil)
        }
    }

    
    // ----- GAME OVER IN ACTION -----
    func handleGameOver(notification: NSNotification) {
        createGameOverMsg()
        disableAddButton()
        if wrongGuesses.count == 7 {
            gameOverMsg.text = "Bummer, you lost!"
            gameOverMsg.backgroundColor = UIColor(red: 254/255, green: 169/255, blue: 169/255, alpha: 1.0)
        } else {
            gameOverMsg.text = "You are victorious!"
            gameOverMsg.backgroundColor = UIColor(red: 165/255, green: 237/255, blue: 153/255, alpha: 1.0)
            
        }
    }
    
    
    // Disable add button when game is over--HOW DO I DO THIS?
    func disableAddButton() {
        if gameOverMsg.text != nil {
            println("Need to disable button")
            //self.navigationItem.rightBarButtonItem.enabled = false
        }
    }
    

    // ----- GAMEOVER MESSAGE LABEL -----
    func createGameOverMsg() {
        gameOverMsg.font = UIFont(name: "Avenir Next", size: 20.0)
        gameOverMsg.numberOfLines = 0
        gameOverMsg.textAlignment = .Center
        self.view.addSubview(gameOverMsg)
        gameOverMsg.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // - Game Over Message Leading -
        let gameOverMsgLeading = NSLayoutConstraint(
            item: gameOverMsg,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 130.0)
        
        // - Game Over Message Trailing -
        let gameOverMsgTrailing = NSLayoutConstraint(
            item: gameOverMsg,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: -20.0)
        
        // - Game Over Message Height -
        let gameOverMsgHeight = NSLayoutConstraint(
            item: gameOverMsg,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1.0,
            constant: 50.0)
        
        // - Game Over Message Vertical Positioning -
        let gameOverMsgVerticalPosition = NSLayoutConstraint(
            item: gameOverMsg,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: 100.0)
        
        self.view.addConstraints([gameOverMsgLeading, gameOverMsgTrailing, gameOverMsgVerticalPosition, gameOverMsgHeight])
    }

    
}

