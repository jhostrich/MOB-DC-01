
import UIKit
import Snap


class SentenceSearchVC: UIViewController {

    // Declaring some labels--these will come in handy later
    var introPlusLocationLabel = Label_SentenceSearch(frame: CGRectZero)
    var whenOpenLabel = Label_SentenceSearch(frame: CGRectZero)
    var extraFeaturesLabel = Label_SentenceSearch(frame: CGRectZero)

    // Declaring some buttons--these will come in handy later
    var locationBtn = DropdownButton(frame: CGRectZero)
    var timesBtn = DropdownButton(frame: CGRectZero)
    var extraFeaturesBtn = DropdownButton(frame: CGRectZero)
    var searchBtn = UIButton()
    
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drawIntroPlusLocationLabel()
        drawLocationBtn()
        
        drawWhenOpenLabel()
        drawTimesBtn()
        
        drawExtraFeaturesLabel()
        drawExtraFeaturesBtn()
        
        drawSearchBtn()
        
        // Make search button move to next view
        self.searchBtn.addTarget(self, action: "goToSearchResults", forControlEvents: .TouchUpInside)
    }
    
    func goToSearchResults() {
        self.performSegueWithIdentifier("showSearchResults", sender: self)
    }
    
    // -----------------------
    // Draw labels and buttons
    // -----------------------

    // First label--starts sentence, plus location
    func drawIntroPlusLocationLabel() {
        self.view.addSubview(introPlusLocationLabel)
        
        introPlusLocationLabel.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width).with.offset(-50)
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(90)
        }
        
        introPlusLocationLabel.text = "I'm looking for a farmers' market \nnear"
    }
    
    // First button--location
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
    
    // Second label--when open
    func drawWhenOpenLabel() {
        self.view.addSubview(whenOpenLabel)
        
        whenOpenLabel.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width).with.offset(-50)
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(self.locationBtn.snp_bottom).with.offset(10)
        }
        
        whenOpenLabel.text = "open"
    }
    
    // Second button set--times
    func drawTimesBtn() {
        self.view.addSubview(timesBtn)
        
        timesBtn.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width).with.offset(-50)
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(self.whenOpenLabel.snp_bottom).with.offset(3)
        }
        
        // placeholder for now--this will be generated (perhaps by array) from modal
        timesBtn.setTitle ("any day", forState: .Normal)
    }
    
    // Third label--extra features
    func drawExtraFeaturesLabel() {
        self.view.addSubview(extraFeaturesLabel)
        
        extraFeaturesLabel.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width).with.offset(-50)
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(self.timesBtn.snp_bottom).with.offset(10)
        }
        
        extraFeaturesLabel.text = "that is"
    }
    
    // Third button set--extra features
    func drawExtraFeaturesBtn() {
        self.view.addSubview(extraFeaturesBtn)
        
        extraFeaturesBtn.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width).with.offset(-50)
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(self.extraFeaturesLabel.snp_bottom).with.offset(3)
        }
        
        // placeholder for now--this will be generated (perhaps by array) from modal
        extraFeaturesBtn.setTitle ("walkable", forState: .Normal)
    }
    
    // Search button
    func drawSearchBtn() {
        self.view.addSubview(searchBtn)
        
        searchBtn.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width).with.offset(-50)
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(self.extraFeaturesBtn.snp_bottom).with.offset(60)
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
