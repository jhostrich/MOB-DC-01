
import UIKit
import Snap


class SentenceSearchViewController: UIViewController, UIScrollViewDelegate {

    // temp for testing
    var timesArray = ["weekdays, pm", "weekends"]
    var extraFeaturesArray = ["walkable", "pet-friendly"]
    
    // ------------------------
    // DECLARING SOME VARIABLES
    // ------------------------
    
    // Location section
    var introPlusLocationLabel = Label_SentenceSearch(frame: CGRectZero)
    var locationBtn = DropdownButton(frame: CGRectZero)

    // Times section
    var whenOpenLabel = Label_SentenceSearch(frame: CGRectZero)
    var timesWrapper = UIView()
    var timesBtnArray: [DropdownButton] = []
    var newTimeBtn = DropdownButton(frame: CGRectZero)

    // Extra features section
    var extraFeaturesLabel = Label_SentenceSearch(frame: CGRectZero)
    var extraFeaturesWrapper = UIView()
    var extraFeaturesBtnArray: [DropdownButton] = []
    var newFeatureBtn = DropdownButton(frame: CGRectZero)
    
    // Search button
    var searchBtn = UIButton()
    
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drawIntroPlusLocationLabel()
        drawLocationBtn()
        
        drawWhenOpenLabel()
        drawTimesWrapper()
        drawTimesBtns()
        
        drawExtraFeaturesLabel()
        drawExtrasWrapper()
        drawExtraFeaturesBtns()
        
        drawSearchBtn()
        
        // Make search button move to next view
        self.searchBtn.addTarget(self, action: "goToSearchResults", forControlEvents: .TouchUpInside)
    }
    
    func goToSearchResults() {
        self.performSegueWithIdentifier("showSearchResults", sender: self)
    }
    
    // Pass query to the new CV
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Grab the destination VC
        let vc = segue.destinationViewController as SearchResultsViewController
        
        // Grab the query info
        let queryInfo = self.prepareParseQuery()

        // Pass it the mode and query
        vc.mode  = queryInfo.mode
        vc.query = queryInfo.query
    }
    
    // Prepare Parse query
    func prepareParseQuery() -> (mode: String, query: PFQuery) {
        /*
        timesArray
        */
        // DEBUG
        // Define the query to grab everything of type Market
        return ("Markets", PFQuery(className: "Market"))//.whereKeyExists("pants"))
    }
    
    // ----------------------------------
    // DRAW WRAPPERS, LABELS, AND BUTTONS
    // ----------------------------------
    
    // --------------
    // Intro/Location
    // --------------
    
    // Intro/location label--this is static
    func drawIntroPlusLocationLabel() {
        self.view.addSubview(introPlusLocationLabel)
        
        introPlusLocationLabel.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width).with.offset(-50)
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(90)
        }
        
        introPlusLocationLabel.text = "I'm looking for a farmers' market \nnear"
    }
    
    // Location button--default is current location
    func drawLocationBtn() {
        self.view.addSubview(locationBtn)
        
        locationBtn.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width).with.offset(-50)
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(self.introPlusLocationLabel.snp_bottom).with.offset(3)
        }

        // placeholder for now--this will be generated (perhaps by array) from modal
        locationBtn.setTitle ("current location", forState: .Normal)
    }
    
    
    // ----------
    // Times Open
    // ----------
    
    // Times label--this is static
    func drawWhenOpenLabel() {
        self.view.addSubview(whenOpenLabel)
        
        whenOpenLabel.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width).with.offset(-50)
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(self.locationBtn.snp_bottom).with.offset(10)
        }
        
        whenOpenLabel.text = "open"
    }
    
    // Wrapper for times button(s)
    func drawTimesWrapper() {
        self.view.addSubview(timesWrapper)
        
        timesWrapper.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width).with.offset(-50)
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(self.whenOpenLabel.snp_bottom).with.offset(3)
        }
    }
    
    // Times button(s)-- default is "any day"
    func drawTimesBtns() {
        
        // initialize timesBtnArray buttons
        for (index, selectedTime) in enumerate(timesArray) {
            var newTimeBtn = DropdownButton(frame: CGRectZero)
            newTimeBtn.setTitle ("\(selectedTime)", forState: .Normal)

            timesBtnArray.append(newTimeBtn)
            self.timesWrapper.addSubview(newTimeBtn)
            
            // set rounded corners if multiple buttons
            if timesArray.count != 1 {
                newTimeBtn.layer.cornerRadius = 10
                // more code here later for added delete functionality
            }
            
            // Position if there's only 1 button
            if index == 0 && timesArray.count == 1 {
                newTimeBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.timesWrapper.snp_width)
                    make.centerX.equalTo(self.view.snp_centerX)
                    make.top.equalTo(self.timesWrapper.snp_top)
                    make.bottom.equalTo(self.timesWrapper.snp_bottom)
                }
            }
                
            // Position if it's the 1st of multiple buttons
            else if index == 0 {
                newTimeBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.timesWrapper.snp_width)
                    make.centerX.equalTo(self.view.snp_centerX)
                    make.top.equalTo(self.timesWrapper.snp_top)
                }
            }
                
            // Position if it's the last of multiple buttons
            else if timesArray.count == index + 1 {
                newTimeBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.timesWrapper.snp_width)
                    make.centerX.equalTo(self.view.snp_centerX)
                    make.top.equalTo(self.timesBtnArray[index-1].snp_bottom).with.offset(5)
                    make.bottom.equalTo(self.timesWrapper.snp_bottom)
                }
            }
                
            // Position if it's in the middle of multiple buttons
            else {
                newTimeBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.timesWrapper.snp_width)
                    make.centerX.equalTo(self.view.snp_centerX)
                    make.top.equalTo(self.timesBtnArray[index-1].snp_bottom).with.offset(5)
                }
            }
        }
    }

    
    // --------------
    // Extra Features
    // --------------
    
    // Extra features label--this is static
    func drawExtraFeaturesLabel() {
        self.view.addSubview(extraFeaturesLabel)
        
        extraFeaturesLabel.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width).with.offset(-50)
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(self.timesWrapper.snp_bottom).with.offset(10)
        }
        
        extraFeaturesLabel.text = "that is"
    }
    
    // Wrapper for extra features button(s)
    func drawExtrasWrapper() {
        self.view.addSubview(extraFeaturesWrapper)
        
        extraFeaturesWrapper.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width).with.offset(-50)
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(self.extraFeaturesLabel.snp_bottom).with.offset(3)
        }
    }
    
    // Extra features button(s)-- default is "walkable"
    func drawExtraFeaturesBtns() {
        
        // initialize extraFeatureBtnArray buttons
        for (index, selectedFeature) in enumerate(extraFeaturesArray) {
            var newFeatureBtn = DropdownButton(frame: CGRectZero)
            newFeatureBtn.setTitle ("\(selectedFeature)", forState: .Normal)
            
            extraFeaturesBtnArray.append(newFeatureBtn)
            self.timesWrapper.addSubview(newFeatureBtn)
            
            // set rounded corners if multiple buttons
            if extraFeaturesArray.count != 1 {
                newFeatureBtn.layer.cornerRadius = 10
                // more code here later for added delete functionality
            }
            
            // Position if there's only 1 button
            if index == 0 && extraFeaturesArray.count == 1 {
                newFeatureBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.extraFeaturesWrapper.snp_width)
                    make.centerX.equalTo(self.view.snp_centerX)
                    make.top.equalTo(self.extraFeaturesWrapper.snp_top)
                    make.bottom.equalTo(self.extraFeaturesWrapper.snp_bottom)
                }
            }
                
            // Position if it's the 1st of multiple buttons
            else if index == 0 {
                newFeatureBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.extraFeaturesWrapper.snp_width)
                    make.centerX.equalTo(self.view.snp_centerX)
                    make.top.equalTo(self.extraFeaturesWrapper.snp_top)
                }
            }
                
            // Position if it's the last of multiple buttons
            else if extraFeaturesArray.count == index + 1 {
                newFeatureBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.extraFeaturesWrapper.snp_width)
                    make.centerX.equalTo(self.view.snp_centerX)
                    make.top.equalTo(self.extraFeaturesBtnArray[index-1].snp_bottom).with.offset(5)
                    make.bottom.equalTo(self.extraFeaturesWrapper.snp_bottom)
                }
            }
                
            // Position if it's in the middle of multiple buttons
            else {
                newFeatureBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.extraFeaturesWrapper.snp_width)
                    make.centerX.equalTo(self.view.snp_centerX)
                    make.top.equalTo(self.extraFeaturesBtnArray[index-1].snp_bottom).with.offset(5)
                }
            }
        }
    }
        
    
    // -------------
    // Search Button
    // -------------
    func drawSearchBtn() {
        self.view.addSubview(searchBtn)
        
        searchBtn.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width).with.offset(-50)
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(self.extraFeaturesWrapper.snp_bottom).with.offset(50)
        }
        
        searchBtn.setTitle ("Search", forState: .Normal)
        searchBtn.titleLabel!.font = UIFont(name: "Raleway-SemiBold", size: 34.0)
        searchBtn.backgroundColor = UIColor(red: 93/255, green: 78/255, blue: 163/255, alpha: 1.0)
        searchBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        searchBtn.layer.cornerRadius = 15
        searchBtn.contentEdgeInsets = UIEdgeInsetsMake(12, 8, 12, 8)
    }
    

    
}


/*

okay, so for this viewcontroller, I want 3 labels
3 buttons that lead to a different screen

plus 1 actual button

I need 2 types of the dropdown buttons
    1 that is when 1 option selected
    1 that is when multiple options selected (so with x)


NOTE: look into dynamic type--I think it makes it easier for type to be fluid size for accessibility


for chevron, Tedi suggests doing a CALayer


*/
