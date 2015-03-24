
import UIKit
import Snap

class SentenceSearchViewController: UIViewController, UIScrollViewDelegate, NewTimesOptionsArray, NewFeaturesOptionsArray
 {
    
    // ------------------------
    // DECLARING SOME VARIABLES
    // ------------------------
   
    // View that goes inside scroll view--allows the scrollView height to adjust to content height
    var contentView = UIView()

    // Location section
    var introPlusLocationLabel = Label_SentenceSearch(frame: CGRectZero)
    var locationBtn = DropdownButton(frame: CGRectZero)

    // Times section
    var whenOpenLabel = Label_SentenceSearch(frame: CGRectZero)
    var timesWrapper = UIView()
    var timesBtnArray: [DropdownButton] = []
    var newTimeBtn = DropdownButton(frame: CGRectZero)
    var timesArray = ["any day"]

    // Extra features section
    var extraFeaturesLabel = Label_SentenceSearch(frame: CGRectZero)
    var extraFeaturesWrapper = UIView()
    var extraFeaturesBtnArray: [UIButton] = []
    var newFeatureBtn = DropdownButton(frame: CGRectZero)
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
            make.width.equalTo(self.view.snp_width).with.offset(-50)
            
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
            make.top.equalTo(self.contentView.snp_top).with.offset(20)
        }
        
        introPlusLocationLabel.text = "I'm looking for a farmers' market \nnear"
    }
    
    // Location button--default is current location
    func drawLocationBtn() {
        self.contentView.addSubview(locationBtn)
        
        locationBtn.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.contentView.snp_width)
            make.centerX.equalTo(self.contentView.snp_centerX)
            make.top.equalTo(self.introPlusLocationLabel.snp_bottom).with.offset(3)
        }

        // placeholder for now--this will be generated (perhaps by array) from modal
        locationBtn.setTitle ("current location", forState: .Normal)
        
        //self.locationBtn.addTarget(self, action: "goToLocationOptions", forControlEvents: .TouchUpInside)

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
            make.top.equalTo(self.locationBtn.snp_bottom).with.offset(10)
        }
        
        whenOpenLabel.text = "open"
    }
    
    // Wrapper for times button(s)
    func drawTimesWrapper() {
        self.contentView.addSubview(timesWrapper)
        
        timesWrapper.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.contentView.snp_width)
            make.centerX.equalTo(self.contentView.snp_centerX)
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
                    make.top.equalTo(self.timesBtnArray[index-1].snp_bottom).with.offset(5)
                    make.bottom.equalTo(self.timesWrapper.snp_bottom)
                }
            }
                
            // Position if it's in the middle of multiple buttons
            else {
                newTimeBtn.snp_makeConstraints { (make) -> () in
                    make.width.equalTo(self.timesWrapper.snp_width)
                    make.centerX.equalTo(self.contentView.snp_centerX)
                    make.top.equalTo(self.timesBtnArray[index-1].snp_bottom).with.offset(5)
                }
            }
            
            // when there's only 1 button
            //if timesArray.count == 1 {
                newTimeBtn.addTarget(self, action: "goToTimesOptions:", forControlEvents: .TouchUpInside)
            //}
                
            // when there's multiple buttons
            if timesArray.count != 1 {
                newTimeBtn.layer.cornerRadius = 10
                // more code here later for added delete functionality
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
            make.top.equalTo(self.timesWrapper.snp_bottom).with.offset(10)
        }
        
        extraFeaturesLabel.text = "that is"
        extraFeaturesLabel.sizeToFit()
    }
    
    // Wrapper for extra features button(s)
    func drawExtrasWrapper() {
        self.contentView.addSubview(extraFeaturesWrapper)
        
        extraFeaturesWrapper.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.contentView.snp_width)
            make.centerX.equalTo(self.contentView.snp_centerX)
            make.top.equalTo(self.extraFeaturesLabel.snp_bottom).with.offset(3)
        }
    }
    
    // Extra features button(s)--default is nothing (empty box)
    func drawExtraFeaturesBtns() {
        if extraFeaturesArray.isEmpty == true {
            extraFeaturesArray.append("Add feature \u{002b}")
            var newFeatureBtn = DropdownButtonEmpty(frame: CGRectZero)
            newFeatureBtn.setTitle ("\(extraFeaturesArray[0])", forState: .Normal)

            
            extraFeaturesBtnArray.append(newFeatureBtn)
            self.extraFeaturesWrapper.addSubview(newFeatureBtn)
            
            newFeatureBtn.snp_makeConstraints { (make) -> () in
                make.width.equalTo(self.extraFeaturesWrapper.snp_width)
                make.centerX.equalTo(self.contentView.snp_centerX)
                make.top.equalTo(self.extraFeaturesWrapper.snp_top)
                make.bottom.equalTo(self.extraFeaturesWrapper.snp_bottom)
            }
            
            drawAddFeatureBtn()
            
        } else {
            // initialize extraFeatureBtnArray buttons
            for (index, selectedFeature) in enumerate(extraFeaturesArray) {
                var newFeatureBtn = DropdownButton(frame: CGRectZero)
                newFeatureBtn.setTitle ("\(selectedFeature)", forState: .Normal)
                
                extraFeaturesBtnArray.append(newFeatureBtn)
                self.extraFeaturesWrapper.addSubview(newFeatureBtn)
                
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
                        make.top.equalTo(self.extraFeaturesBtnArray[index-1].snp_bottom).with.offset(5)
                        make.bottom.equalTo(self.extraFeaturesWrapper.snp_bottom)
                    }
                }
                    
                // Position if it's in the middle of multiple buttons
                else {
                    newFeatureBtn.snp_makeConstraints { (make) -> () in
                        make.width.equalTo(self.extraFeaturesWrapper.snp_width)
                        make.centerX.equalTo(self.contentView.snp_centerX)
                        make.top.equalTo(self.extraFeaturesBtnArray[index-1].snp_bottom).with.offset(5)
                    }
                }
                
                // when there's only 1 button
                //if extraFeaturesArray.count == 1 {
                    newFeatureBtn.addTarget(self, action: "goToExtraFeaturesOptions:", forControlEvents: .TouchUpInside)
                //}
                
                // when there's multiple buttons
                if extraFeaturesArray.count != 1 {
                    newFeatureBtn.layer.cornerRadius = 10
                    // more code here later for added delete functionality
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
            make.top.equalTo(self.extraFeaturesWrapper.snp_bottom).with.offset(50)
            make.bottom.equalTo(self.contentView.snp_bottom).with.offset(-40)
        }
        
        searchBtn.setTitle ("Search", forState: .Normal)
        searchBtn.titleLabel!.font = UIFont(name: "Raleway-SemiBold", size: 34.0)
        searchBtn.backgroundColor = UIColor(red: 93/255, green: 78/255, blue: 163/255, alpha: 1.0)
        searchBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        searchBtn.layer.cornerRadius = 15
        searchBtn.contentEdgeInsets = UIEdgeInsetsMake(12, 8, 12, 8)
        
        // Make search button move to next view
        self.searchBtn.addTarget(self, action: "goToSearchResults", forControlEvents: .TouchUpInside)

    }
    


    // ----------------------------------
    // TO DO STUFF
    // ----------------------------------

    
    func drawAddFeatureBtn() {
        var addFeatureBtn = UIButton()
        self.contentView.addSubview(addFeatureBtn)
        
        addFeatureBtn.snp_makeConstraints { (make) -> () in
            make.width.equalTo(24)
            make.height.equalTo(24)
            make.leading.equalTo(self.extraFeaturesLabel.snp_trailing).with.offset(10)
            make.top.equalTo(self.extraFeaturesLabel.snp_top).with.offset(10)
        }
        
        addFeatureBtn.backgroundColor = UIColor(red: 213/255, green: 209/255, blue: 236/255, alpha: 1.0)
        addFeatureBtn.layer.cornerRadius = 12
        
        addFeatureBtn.addTarget(self, action: "goToExtraFeaturesOptions:", forControlEvents: .TouchUpInside)

    }
    
    func goToTimesOptions(sender: AnyObject) {
        var timesOptionsVC = self.storyboard?.instantiateViewControllerWithIdentifier("timesOptionsVC") as TimesOptionsViewController
        var navigationController = UINavigationController(rootViewController: timesOptionsVC)
        
        timesOptionsVC.delegate = self
        
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    
    func addNewTimes(chosenTimesArray: [String]) {
        timesArray = chosenTimesArray
        
        // Remove old buttons
        for newTimeBtn in timesBtnArray {
            newTimeBtn.snp_removeConstraints()
            newTimeBtn.removeFromSuperview()
        }
        
        timesBtnArray.removeAll(keepCapacity: false)
        
        drawTimesBtns()
    }
    

    func goToExtraFeaturesOptions(sender: AnyObject) {
        var extraFeaturesOptionsVC = self.storyboard?.instantiateViewControllerWithIdentifier("extraFeaturesOptionsVC") as ExtraFeaturesOptionsViewController
        var navigationController = UINavigationController(rootViewController: extraFeaturesOptionsVC)
        
        extraFeaturesOptionsVC.delegate = self
        
        self.presentViewController(navigationController, animated: true, completion: nil)
    }

    func addNewFeatures(chosenFeatureArray: [String]) {
        extraFeaturesArray = chosenFeatureArray
        
        // Remove old buttons
        for newFeatureBtn in extraFeaturesBtnArray {
            newFeatureBtn.snp_removeConstraints()
            newFeatureBtn.removeFromSuperview()
        }
        
        extraFeaturesBtnArray.removeAll(keepCapacity: false)
        
        drawExtraFeaturesBtns()
    }
    
    func goToSearchResults() {
        self.performSegueWithIdentifier("showSearchResults", sender: self)
    }

    
    
}


/*


NOTE: look into dynamic type--I think it makes it easier for type to be fluid size for accessibility


for chevron, Tedi suggests doing a CALayer

so yay, it's working now!

what do I still need to do?

1) set up location view
2) make them able to just delete when more than 1 option--X appears
3) add chevrons/icons
4) clean up files--like linking in MyColor class



*/
