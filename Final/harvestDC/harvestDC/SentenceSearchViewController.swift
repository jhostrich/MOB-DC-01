
import UIKit
import SnapKit

class SentenceSearchViewController: UIViewController, UIScrollViewDelegate, NewLocation, NewTimesOptionsArray, NewFeaturesOptionsArray
 {
    
    // ------------------------
    // DECLARING SOME VARIABLES
    // ------------------------
   
    // View that goes inside scroll view--allows the scrollView height to adjust to content height
    var contentView = UIView()

    // Location section
    var introPlusLocationLabel = Label_SentenceSearch(frame: CGRectZero)
    var locationBtn = DropdownButton()
    var chosenLocationString = "current location"
    var searchLocation: PFGeoPoint?
    // Default search radius to 5 miles
    var searchRadiusMiles = 5.0

    // Times section
    var whenOpenLabel = Label_SentenceSearch(frame: CGRectZero)
    var timesWrapper = UIView()
    var timesBtnArray: [DropdownButton] = []
    var newTimeBtn = DropdownButton()
    var timesArray = ["any day"]

    // Extra features section
    var extraFeaturesLabel = Label_SentenceSearch(frame: CGRectZero)
    var extraFeaturesWrapper = UIView()
    var extraFeaturesBtnArray: [DropdownButton] = []
    var newFeatureBtn = DropdownButton()
    var extraFeaturesArray: [String] = []
    
    // Search button
    var searchBtn = UIButton()
    
    // Scroll view--allows the page to scroll
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
        
        // Draw all objects
        createContentViewInsideScrollView()
        
        drawIntroPlusLocationLabel()
        drawLocationBtn()
        
        drawWhenOpenLabel()
        drawTimesWrapper()
        drawTimesBtns()
        
        drawExtraFeaturesLabel()
        drawExtrasWrapper()
        drawExtraFeaturesBtns()
        
        drawSearchBtn()
        
    }
    
    
    // ------------------------------------------------------
    // CREATE CONTENT VIEW, THAT OTHER OBJECTS WILL GO INSIDE
    // ------------------------------------------------------
    
    // Create contentView inside of ScrollView--allows the scrollView height to adjust to content height
    func createContentViewInsideScrollView() {
        self.scrollView.addSubview(contentView)
        
        contentView.snp_makeConstraints { (make) -> () in
            
            // Width is set equal to view, not scrollView, because scrollView width is ambiguous--thanks Natasha The Robot!
            make.width.equalTo(self.view.snp_width).offset(-50)
            
            make.centerX.equalTo(self.scrollView.snp_centerX)
            make.top.equalTo(self.scrollView.snp_top)
            make.bottom.equalTo(self.scrollView.snp_bottom)
        }
    }
    
    
    // ----------------------------------
    // DRAW WRAPPERS, LABELS, AND BUTTONS
    // ----------------------------------
    
    // --------------
    // Intro/Location
    // --------------
    
    // Intro/location label--this is static
    func drawIntroPlusLocationLabel() {
        self.contentView.addSubview(introPlusLocationLabel)
        
        introPlusLocationLabel.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.contentView.snp_width)
            make.centerX.equalTo(self.contentView.snp_centerX)
            make.top.equalTo(self.contentView.snp_top).offset(20)
        }
        
        introPlusLocationLabel.text = "I'm looking for a farmers' market \nnear"
    }
    
    // Location button--default is current location
    // NOTE: will always be just 1 button
    func drawLocationBtn() {
        self.contentView.addSubview(locationBtn)
        
        locationBtn.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.contentView.snp_width)
            make.centerX.equalTo(self.contentView.snp_centerX)
            make.top.equalTo(self.introPlusLocationLabel.snp_bottom).offset(3)
        }

        locationBtn.labelBtnInsideView.setTitle (chosenLocationString, forState: .Normal)
        
        
        // Still working on functionality for Location VC
        // self.locationBtn.labelBtnInsideView.addTarget(self, action: "goToLocationOptions:", forControlEvents: .TouchUpInside)

    }
    
    
    // ----------
    // Times Open
    // ----------
    
    // Times label--this is static
    func drawWhenOpenLabel() {
        self.contentView.addSubview(whenOpenLabel)
        
        whenOpenLabel.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.contentView.snp_width)
            make.centerX.equalTo(self.contentView.snp_centerX)
            make.top.equalTo(self.locationBtn.snp_bottom).offset(10)
        }
        
        whenOpenLabel.text = "open"
    }
    
    // Wrapper for times button(s)
    func drawTimesWrapper() {
        self.contentView.addSubview(timesWrapper)
        
        timesWrapper.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.contentView.snp_width)
            make.centerX.equalTo(self.contentView.snp_centerX)
            make.top.equalTo(self.whenOpenLabel.snp_bottom).offset(3)
        }
    }
    
    // Times button(s)-- default is "any day"
    func drawTimesBtns() {
        
        // initialize timesBtnArray buttons
        for (index, selectedTime) in timesArray.enumerate() {
            let newTimeBtn = DropdownButton()
            newTimeBtn.labelBtnInsideView.setTitle (selectedTime, forState: .Normal)

            timesBtnArray.append(newTimeBtn)
            self.timesWrapper.addSubview(newTimeBtn)
            
            // Position if there's only 1 button
            if index == 0 && timesArray.count == 1 {
                newTimeBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.timesWrapper.snp_width)
                    make.centerX.equalTo(self.contentView.snp_centerX)
                    make.top.equalTo(self.timesWrapper.snp_top)
                    make.bottom.equalTo(self.timesWrapper.snp_bottom)
                }
            }
                
            // Position if it's the 1st of multiple buttons
            else if index == 0 {
                newTimeBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.timesWrapper.snp_width)
                    make.centerX.equalTo(self.contentView.snp_centerX)
                    make.top.equalTo(self.timesWrapper.snp_top)
                }
            }
                
            // Position if it's the last of multiple buttons
            else if timesArray.count == index + 1 {
                newTimeBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.timesWrapper.snp_width)
                    make.centerX.equalTo(self.contentView.snp_centerX)
                    make.top.equalTo(self.timesBtnArray[index-1].snp_bottom).offset(5)
                    make.bottom.equalTo(self.timesWrapper.snp_bottom)
                }
            }
                
            // Position if it's in the middle of multiple buttons
            else {
                newTimeBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.timesWrapper.snp_width)
                    make.centerX.equalTo(self.contentView.snp_centerX)
                    make.top.equalTo(self.timesBtnArray[index-1].snp_bottom).offset(5)
                }
            }
            
            newTimeBtn.labelBtnInsideView.addTarget(self, action: "goToTimesOptions:", forControlEvents: .TouchUpInside)
            newTimeBtn.moreOptionsArrowView.addTarget(self, action: "goToTimesOptions:", forControlEvents: .TouchUpInside)

            
            
            // When there's multiple buttons, add ability to remove a button
            if timesArray.count != 1 {
                newTimeBtn.layer.cornerRadius = 10
                newTimeBtn.cancelBtnInsideView.hidden = false
                newTimeBtn.moreOptionsArrowView.hidden = true
                newTimeBtn.cancelBtnInsideView.tag = index
                newTimeBtn.cancelBtnInsideView.addTarget(self, action: "removeTimeBtn:", forControlEvents: .TouchUpInside)
            }
        }
    }

    
    // --------------
    // Extra Features
    // --------------
    
    // Extra features label--this is static
    func drawExtraFeaturesLabel() {
        self.contentView.addSubview(extraFeaturesLabel)
        
        extraFeaturesLabel.snp_makeConstraints { (make) -> () in
            make.leading.equalTo(self.contentView.snp_leading)
            make.centerX.equalTo(self.contentView.snp_centerX)
            make.top.equalTo(self.timesWrapper.snp_bottom).offset(10)
        }
        
        extraFeaturesLabel.text = "that is"
    }
    
    // Wrapper for extra features button(s)
    func drawExtrasWrapper() {
        self.contentView.addSubview(extraFeaturesWrapper)
        
        extraFeaturesWrapper.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.contentView.snp_width)
            make.centerX.equalTo(self.contentView.snp_centerX)
            make.top.equalTo(self.extraFeaturesLabel.snp_bottom).offset(3)
        }
    }
    
    // Extra features button(s)--default is nothing (empty box)
    func drawExtraFeaturesBtns() {
        if extraFeaturesArray.isEmpty == true {
            extraFeaturesArray.append("Add feature +")
            newFeatureBtn = DropdownButton(empty: true)
            newFeatureBtn.labelBtnInsideView.setTitle ("\(extraFeaturesArray[0])", forState: .Normal)
            
            extraFeaturesBtnArray.append(newFeatureBtn)
            self.extraFeaturesWrapper.addSubview(newFeatureBtn)
            
            newFeatureBtn.moreOptionsArrowView.hidden = true

            newFeatureBtn.snp_makeConstraints { (make) -> () in
                make.width.equalTo(self.extraFeaturesWrapper.snp_width)
                make.centerX.equalTo(self.contentView.snp_centerX)
                make.top.equalTo(self.extraFeaturesWrapper.snp_top)
                make.bottom.equalTo(self.extraFeaturesWrapper.snp_bottom)
            }
            
            newFeatureBtn.labelBtnInsideView.addTarget(self, action: "goToExtraFeaturesOptions:", forControlEvents: .TouchUpInside)
            
        } else {
            // initialize extraFeatureBtnArray buttons
            for (index, selectedFeature) in extraFeaturesArray.enumerate() {
                let newFeatureBtn = DropdownButton()
                newFeatureBtn.labelBtnInsideView.setTitle ("\(selectedFeature)", forState: .Normal)
                
                extraFeaturesBtnArray.append(newFeatureBtn)
                self.extraFeaturesWrapper.addSubview(newFeatureBtn)
                
                newFeatureBtn.moreOptionsArrowView.hidden = true
                
                // Position if there's only 1 button
                if index == 0 && extraFeaturesArray.count == 1 {
                    newFeatureBtn.snp_makeConstraints { (make) -> () in
                        make.width.equalTo(self.extraFeaturesWrapper.snp_width)
                        make.centerX.equalTo(self.contentView.snp_centerX)
                        make.top.equalTo(self.extraFeaturesWrapper.snp_top)
                        make.bottom.equalTo(self.extraFeaturesWrapper.snp_bottom)
                    }
                }
                    
                // Position if it's the 1st of multiple buttons
                else if index == 0 {
                    newFeatureBtn.snp_makeConstraints { (make) -> () in
                        make.width.equalTo(self.extraFeaturesWrapper.snp_width)
                        make.centerX.equalTo(self.contentView.snp_centerX)
                        make.top.equalTo(self.extraFeaturesWrapper.snp_top)
                    }
                }
                    
                // Position if it's the last of multiple buttons
                else if extraFeaturesArray.count == index + 1 {
                    newFeatureBtn.snp_makeConstraints { (make) -> () in
                        make.width.equalTo(self.extraFeaturesWrapper.snp_width)
                        make.centerX.equalTo(self.contentView.snp_centerX)
                        make.top.equalTo(self.extraFeaturesBtnArray[index-1].snp_bottom).offset(5)
                        make.bottom.equalTo(self.extraFeaturesWrapper.snp_bottom)
                    }
                }
                    
                // Position if it's in the middle of multiple buttons
                else {
                    newFeatureBtn.snp_makeConstraints { (make) -> () in
                        make.width.equalTo(self.extraFeaturesWrapper.snp_width)
                        make.centerX.equalTo(self.contentView.snp_centerX)
                        make.top.equalTo(self.extraFeaturesBtnArray[index-1].snp_bottom).offset(5)
                    }
                }
                
                newFeatureBtn.labelBtnInsideView.addTarget(self, action: "goToExtraFeaturesOptions:", forControlEvents: .TouchUpInside)

                // When there's multiple buttons, add ability to remove a button
                if extraFeaturesArray.count != 0 {
                    newFeatureBtn.layer.cornerRadius = 10
                    newFeatureBtn.cancelBtnInsideView.hidden = false
                    newFeatureBtn.cancelBtnInsideView.tag = index
                    newFeatureBtn.cancelBtnInsideView.addTarget(self, action: "removeFeatureBtn:", forControlEvents: .TouchUpInside)
                }
            }
        }
    }

    
    // -------------
    // Search Button
    // -------------
    func drawSearchBtn() {
        self.contentView.addSubview(searchBtn)
        
        searchBtn.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.contentView.snp_width)
            make.centerX.equalTo(self.contentView.snp_centerX)
            make.top.equalTo(self.extraFeaturesWrapper.snp_bottom).offset(50)
            make.bottom.equalTo(self.contentView.snp_bottom).offset(-40)
        }
        
        searchBtn.setTitle ("Search", forState: .Normal)
        searchBtn.titleLabel!.font = UIFont(name: "Raleway-SemiBold", size: 34.0)
        searchBtn.backgroundColor = MyColors.purple()
        searchBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        searchBtn.layer.cornerRadius = 15
        searchBtn.contentEdgeInsets = UIEdgeInsetsMake(12, 8, 12, 8)
        
        // Make search button move to next view
        self.searchBtn.addTarget(self, action: "goToSearchResults", forControlEvents: .TouchUpInside)

    }
    


    // -----------------------------------
    // MAKING THE BUTTONS DO AWESOME STUFF
    // -----------------------------------
    
    
    // --------
    // Location
    // --------
    
    func goToLocationOptions(sender: AnyObject) {
        let locationOptionsVC = self.storyboard?.instantiateViewControllerWithIdentifier("locationOptionsVC") as! LocationOptionsViewController
        let navigationController = UINavigationController(rootViewController: locationOptionsVC)
        
        // Pass current selections (if first time going to locationOptionsVC, will be default "current location")
        locationOptionsVC.chosenLocationString = self.chosenLocationString
        locationOptionsVC.searchLocation = self.searchLocation
        
        locationOptionsVC.delegate = self
        
        self.presentViewController(navigationController, animated: true, completion: nil)

    }
    
    func addNewLocation(chosenLocationString: String, searchLocation: PFGeoPoint) {
        self.chosenLocationString = chosenLocationString
        self.searchLocation = searchLocation
        
        locationBtn.labelBtnInsideView.setTitle (chosenLocationString, forState: .Normal)
    }
    
    
    
    // ----------
    // Times Open
    // ----------

    // Bring up times options modal view
    func goToTimesOptions(sender: AnyObject) {
        let timesOptionsVC = self.storyboard?.instantiateViewControllerWithIdentifier("timesOptionsVC") as! TimesOptionsViewController
        let navigationController = UINavigationController(rootViewController: timesOptionsVC)
        
        // Pass current selections (if first time going to timesOptionsVC, will just be the default "any day")
        timesOptionsVC.timesArray = self.timesArray
        
        timesOptionsVC.delegate = self
        
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    
    // Add new times that were selected in the modal view
    func addNewTimes(timesArray: [String]) {
        self.timesArray = timesArray

        // remove old buttons and draw new ones
        cleanTimesBtnArray()
    }
    
    // Delete a times Dropdown button when the X cancel button is pressed
    func removeTimeBtn(sender: DropdownButton) {
        timesArray.removeAtIndex(sender.tag)
        
        cleanTimesBtnArray()
    }

    // Remove all buttons and redraw them--to be used when array has changed
    func cleanTimesBtnArray() {
        // Remove old buttons
        for newTimeBtn in timesBtnArray {
            newTimeBtn.snp_removeConstraints()
            newTimeBtn.removeFromSuperview()
        }
        
        timesBtnArray.removeAll(keepCapacity: false)
        
        // Draw new buttons
        drawTimesBtns()
    }
    
    
    // --------------
    // Extra Features
    // --------------

    // Bring up extra features options modal view
    func goToExtraFeaturesOptions(sender: AnyObject) {
        let extraFeaturesOptionsVC = self.storyboard?.instantiateViewControllerWithIdentifier("extraFeaturesOptionsVC") as! ExtraFeaturesOptionsViewController
        let navigationController = UINavigationController(rootViewController: extraFeaturesOptionsVC)
        
        // Pass current selections (if first time going to extraFeaturesOptionsVC, will be empty array)
        extraFeaturesOptionsVC.extraFeaturesArray = self.extraFeaturesArray
        
        extraFeaturesOptionsVC.delegate = self
        
        self.presentViewController(navigationController, animated: true, completion: nil)
    }

    // Add new features that were selected in the modal view
    func addNewFeatures(chosenFeatureArray: [String]) {
        extraFeaturesArray = chosenFeatureArray
        
        cleanExtraFeaturesBtnArray()
    }
    
    // Delete a feature Dropdown button when the X cancel button is pressed
    func removeFeatureBtn(sender: DropdownButton) {
        extraFeaturesArray.removeAtIndex(sender.tag)
        
        cleanExtraFeaturesBtnArray()
    }

    // Remove all buttons and redraw them--to be used when array has changed
    func cleanExtraFeaturesBtnArray() {
        // Remove old buttons
        for newFeatureBtn in extraFeaturesBtnArray {
            newFeatureBtn.snp_removeConstraints()
            newFeatureBtn.removeFromSuperview()
        }
        
        extraFeaturesBtnArray.removeAll(keepCapacity: false)
        
        drawExtraFeaturesBtns()
    }

    
    // -------------
    // Search Button
    // -------------

    func goToSearchResults() {
        self.performSegueWithIdentifier("showSearchResults", sender: self)
    }

    // Pass query to the new CV
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Grab the destination VC
        let vc = segue.destinationViewController as! SearchResultsViewController
        
        // Grab the query info
        let queryInfo = self.prepareParseQuery()
        
        // Pass it the mode and query
        vc.mode  = queryInfo.mode
        vc.query = queryInfo.query
    }

    
    // -------------------
    // Prepare Parse Query
    // -------------------

    
    func prepareParseQuery() -> (mode: String, query: PFQuery) {
        
        // Initialize
        let query = PFQuery(className: "Market")
        
        // geoPoint
        if let loc = self.searchLocation {
            query.whereKey("geoLocation", nearGeoPoint: loc, withinMiles: self.searchRadiusMiles)
        }
        
        // openCategories
        if self.timesArray[0] != "any day" {
            query.whereKey("openCategories", containedIn: self.timesArray)
        }
        
        // extraFeatures
        if self.extraFeaturesArray[0] != "Add feature +" {
            query.whereKey("extras", containsAllObjectsInArray: self.extraFeaturesArray)
        }
        
        return ("Markets", query)
    }

    
}


/*

Next steps:

1) finish setting up location view
2) add chevrons--do with CALayer
3) continue streamlining files

NOTE: look into dynamic type--I think it makes it easier for type to be fluid size for accessibility


*/
