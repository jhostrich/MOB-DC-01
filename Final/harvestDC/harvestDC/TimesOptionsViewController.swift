
import UIKit
import Snap


protocol NewTimesOptionsArray {
    func addNewTimes(chosenTimesArray: [String])
}

class TimesOptionsViewController: UIViewController, UIScrollViewDelegate {

    // ------------------------
    // DECLARING SOME VARIABLES
    // ------------------------
    
    var delegate: NewTimesOptionsArray?
    
    // Here are the time filter options
    // TODO: Replace calls to this with SearchResult.listOpenCategories
    var timeOptionsArray = ["any day", "today", "weekdays, am", "weekdays, pm", "weekends"]
    
    // Here is the array to be passed back to the sentence search view controller
    var chosenTimesArray = ["any day"]
    
    // View that goes inside scroll view--allows the scrollView height to adjust to content height
    var contentView = UIView()
    
    // Label
    var openLabel = Label_MainFilter(frame: CGRectZero)
    
    // Buttons
    var newTimeBtn = MainFilterOptionsBtn(frame: CGRectZero)
    var timeOptionsBtnArray: [MainFilterOptionsBtn] = []
    
    // Scroll view--allows the page to scroll
    // NOTE: there's not enough content to scroll, but including this here for future scaling purposes
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            self.scrollView.delegate = self
            self.scrollView.showsVerticalScrollIndicator = false
        }
    }
    
    
    // -------------
    // VIEW-DID-LOAD
    // -------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBarItems()
        createContentViewInsideScrollView()
        drawOpenLabel()
        drawTimesBtns()
        
    }

    // -------------
    // NAV BAR ITEMS
    // -------------
    // Set up nav bar items
    func setNavBarItems() {
        let cancelButton = FancyBarButton(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "dismiss")
        let doneButton = FancyBarButton(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "done")
        
        self.navigationItem.setLeftBarButtonItem(cancelButton, animated: true)
        self.navigationItem.setRightBarButtonItem(doneButton, animated: true)
    }
    
    // ------------------------------------------------------
    // CREATE CONTENT VIEW, THAT OTHER OBJECTS WILL GO INSIDE
    // ------------------------------------------------------
    
    // Create contentView inside of ScrollView--allows the scrollView height to adjust to content height
    func createContentViewInsideScrollView() {
        self.scrollView.addSubview(contentView)
        
        contentView.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width).with.offset(-20)
            make.centerX.equalTo(self.scrollView.snp_centerX)
            make.top.equalTo(self.scrollView.snp_top)
            make.bottom.equalTo(self.scrollView.snp_bottom)
        }
    }
    
    
    // ----------------------------------
    // DRAW LABELS AND BUTTONS
    // ----------------------------------
    
    // Times label--this is static
    func drawOpenLabel() {
        self.contentView.addSubview(openLabel)
        
        openLabel.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.contentView.snp_width).with.offset(-30)
            make.centerX.equalTo(self.contentView.snp_centerX)
            make.top.equalTo(self.contentView.snp_top).with.offset(20)
        }
        
        openLabel.text = "open"

    }
    
    // Times buttons--created from timeOptionsArray
    func drawTimesBtns() {
        
        // Create a button for each item in timeOptionsArray
        for (index, timeOption) in enumerate(timeOptionsArray) {
            var newTimeBtn = MainFilterOptionsBtn(frame: CGRectZero)
            newTimeBtn.setTitle("\(timeOption)", forState: .Normal)
            
            timeOptionsBtnArray.append(newTimeBtn)
            self.contentView.addSubview(newTimeBtn)

            // Add target functionality
            newTimeBtn.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)

            // Set select style on buttons already selected
            if contains(chosenTimesArray,"\(newTimeBtn.currentTitle!)") {
                newTimeBtn.selectBtnStyle()
            }

            // ----------------
            // Position options
            // ----------------
            
            // Position if it's the 1st of multiple buttons
            if index == 0 {
                newTimeBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.contentView.snp_width)
                    make.centerX.equalTo(self.contentView.snp_centerX)
                    make.top.equalTo(self.openLabel.snp_bottom).with.offset(5)
                }
            }
                
            // Position if it's the last of multiple buttons
            else if timeOptionsArray.count == index + 1 {
                newTimeBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.contentView.snp_width)
                    make.centerX.equalTo(self.contentView.snp_centerX)
                    make.top.equalTo(self.timeOptionsBtnArray[index-1].snp_bottom).with.offset(2)
                    make.bottom.equalTo(self.contentView.snp_bottom).with.offset(-40)
                }
            }
                
            // Position if it's in the middle of multiple buttons
            else {
                newTimeBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.contentView.snp_width)
                    make.centerX.equalTo(self.contentView.snp_centerX)
                    make.top.equalTo(self.timeOptionsBtnArray[index-1].snp_bottom).with.offset(2)
                }
            }
        }
    }
    
    // -------------------
    // FUNCTIONALITY STUFF
    // -------------------
    
    // When the buttons are pressed
    // NOTE: "any day" button is the default and can only be selected by itself
    func buttonPressed(sender: MainFilterOptionsBtn) {
        
        // Special case: Deselects "any day" if any other button is pressed
        if sender.currentTitle! != "any day" {
            chosenTimesArray = chosenTimesArray.filter { $0 != "any day" }
            timeOptionsBtnArray[0].deselectBtnStyle()
        }
        
        // Special case: Deselects all other buttons if "any day" is pressed
        if sender.currentTitle == "any day" {
            chosenTimesArray = ["any day"]
            timeOptionsBtnArray[0].selectBtnStyle()
            
            timeOptionsBtnArray[1].deselectBtnStyle()
            timeOptionsBtnArray[2].deselectBtnStyle()
            timeOptionsBtnArray[3].deselectBtnStyle()
            timeOptionsBtnArray[4].deselectBtnStyle()
        }
        
        // If pressed button is unselected, select and add to chosenTimeArray
         else if !contains(chosenTimesArray,sender.currentTitle!) {
            chosenTimesArray.append("\(sender.currentTitle!)")
            sender.selectBtnStyle()
            
        // If pressed button is selected, unselect it and remove from chosenTimeArray
        } else {
            chosenTimesArray = chosenTimesArray.filter { $0 != sender.currentTitle }
            sender.deselectBtnStyle()
            
        }

        // Special case: Automatically selects "any day" if nothing else selected
        if chosenTimesArray.isEmpty {
            chosenTimesArray = ["any day"]
            timeOptionsBtnArray[0].selectBtnStyle()
        }
    }
    
    // Dismissing VC--through navBarItems
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Passing new times back to Sentence Search VC--through Done navBarItem
    func done() {
        self.delegate?.addNewTimes(chosenTimesArray)
        dismiss()
    }
}
