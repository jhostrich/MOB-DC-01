
import UIKit
import Snap


protocol NewFeaturesOptionsArray {
    func addNewFeatures(extraFeaturesArray: [String])
}

class ExtraFeaturesOptionsViewController: UIViewController, UIScrollViewDelegate {

    // ------------------------
    // DECLARING SOME VARIABLES
    // ------------------------

    var delegate: NewFeaturesOptionsArray?
    
    // Here are the filter options
    var extraFeaturesOptionsArray = ["walkable", "metro-accessible", "parkable (for free)", "accessible", "pet-friendly"]
    
    // Here is the array to be passed back to the sentence search view controller
    var extraFeaturesArray: [String] = []
    
    // View that goes inside scroll view--allows the scrollView height to adjust to content height
    var contentView = UIView()

    // Label
    var extraFeaturesLabel = Label_MainFilter(frame: CGRectZero)
    
    // Buttons
    var newFeatureBtn = MainFilterOptionsBtn(frame: CGRectZero)
    var featureOptionsBtnArray: [MainFilterOptionsBtn] = []
    
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

        removeDefaultEmptyString()

        setNavBarItems()
        createContentViewInsideScrollView()
        drawExtraFeaturesLabel()
        drawExtraFeaturesBtns()
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

    // Extra features label--this is static
    func drawExtraFeaturesLabel() {
        self.contentView.addSubview(extraFeaturesLabel)

        extraFeaturesLabel.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.contentView.snp_width).with.offset(-30)
            make.centerX.equalTo(self.contentView.snp_centerX)
            make.top.equalTo(self.contentView.snp_top).with.offset(20)
        }
        
        extraFeaturesLabel.text = "that is"
        
    }
    
    // Feature buttons--created from extraFeaturesOptionsArray
    func drawExtraFeaturesBtns() {
    
        // Create a button for each item in extraFeaturesOptionsArray
        for (index, featureOption) in enumerate(extraFeaturesOptionsArray) {
            var newFeatureBtn = MainFilterOptionsBtn(frame: CGRectZero)
            newFeatureBtn.setTitle("\(featureOption)", forState: .Normal)
    
            featureOptionsBtnArray.append(newFeatureBtn)
            self.contentView.addSubview(newFeatureBtn)
            
            // Add target functionality
            newFeatureBtn.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)

            // Set select style on buttons already selected
            if contains(extraFeaturesArray,"\(newFeatureBtn.currentTitle!)") {
                newFeatureBtn.selectBtnStyle()
            }
            
            // ----------------
            // Position options
            // ----------------
            
            // Position if it's the 1st of multiple buttons
            if index == 0 {
                newFeatureBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.contentView.snp_width)
                    make.centerX.equalTo(self.contentView.snp_centerX)
                    make.top.equalTo(self.extraFeaturesLabel.snp_bottom).with.offset(5)
                }
            }
                
            // Position if it's the last of multiple buttons
            else if extraFeaturesOptionsArray.count == index + 1 {
                newFeatureBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.contentView.snp_width)
                    make.centerX.equalTo(self.contentView.snp_centerX)
                    make.top.equalTo(self.featureOptionsBtnArray[index-1].snp_bottom).with.offset(2)
                    make.bottom.equalTo(self.contentView.snp_bottom).with.offset(-40)
                }
            }
                
            // Position if it's in the middle of multiple buttons
            else {
                newFeatureBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.contentView.snp_width)
                    make.centerX.equalTo(self.contentView.snp_centerX)
                    make.top.equalTo(self.featureOptionsBtnArray[index-1].snp_bottom).with.offset(2)
                }
            }
        }
    }
    
    
    // -------------------
    // FUNCTIONALITY STUFF
    // -------------------
    
    // Special case: Checks if the initial default "Add feature +" is in the array--and if so, removes it
    func removeDefaultEmptyString() {
        if contains(extraFeaturesArray,"Add feature +") {
            extraFeaturesArray = extraFeaturesArray.filter { $0 != "Add feature +" }
        }
            println(extraFeaturesArray)
    }
    
    // When the buttons are pressed
    func buttonPressed(sender: MainFilterOptionsBtn) {
        
        // If pressed button is unselected, select and add to extraFeaturesArray
        if !contains(extraFeaturesArray,sender.currentTitle!) {
            extraFeaturesArray.append("\(sender.currentTitle!)")
            sender.selectBtnStyle()
            
        // If pressed button is selected, unselect it and remove from extraFeaturesArray
        } else {
            extraFeaturesArray = extraFeaturesArray.filter { $0 != sender.currentTitle }
            sender.deselectBtnStyle()
            
        }
        
    }

    // Dismissing VC--through navBarItems
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Passing new features back to Sentence Search VC--through Done navBarItem
    func done() {
        self.delegate?.addNewFeatures(extraFeaturesArray)
        dismiss()
    }

}
