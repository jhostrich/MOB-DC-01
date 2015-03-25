
import UIKit
import Snap


protocol NewLocation {
    func addNewLocation(chosenLocationString: String, searchLocation: PFGeoPoint)
}

class LocationOptionsViewController: UIViewController {

    // ------------------------
    // DECLARING SOME VARIABLES
    // ------------------------
    
    var delegate: NewLocation?
    
    // String and PFGeoPoint to be passed back to the sentence search view controller
    var chosenLocationString: String?
    var searchLocation: PFGeoPoint?
    
    // Label
    var locationLabel = Label_MainFilter(frame: CGRectZero)

    // Text field
    var locationTextField = UITextField()
    
    // Table view
    var locationOptionsTableView = UITableView()
    
    
    
    // -------------
    // VIEW-DID-LOAD
    // -------------

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("success 2")
        
        setNavBarItems()
        drawLocationLabel()
        drawLocationTextField()
        drawTableView()

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

    
    // ----------------------------------
    // DRAW LABELS AND BUTTONS
    // ----------------------------------

    // Location label--this is static
    func drawLocationLabel() {
        self.view.addSubview(locationLabel)
        
        locationLabel.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width).with.offset(-50)
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(self.view.snp_top).with.offset(84)
        }
        
        locationLabel.text = "near"
        
    }

    
    // Main text field
    func drawLocationTextField() {
        self.view.addSubview(locationTextField)
        
        locationTextField.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width).with.offset(-30)
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(self.locationLabel.snp_bottom).with.offset(5)
        }
        
        locationTextField.font = UIFont(name: "Raleway-Light", size: 28.0)
        locationTextField.backgroundColor = UIColor.whiteColor()
        locationTextField.textColor = MyColors.darkGrey()
        locationTextField.placeholder = chosenLocationString
        
    }
    
    
    // Table view
    func drawTableView() {
        self.view.addSubview(locationOptionsTableView)
        
        locationOptionsTableView.snp_makeConstraints { (make) -> () in
            make.width.equalTo(self.view.snp_width)
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(self.locationTextField.snp_bottom).with.offset(10)
        }
    }
    
    
    // -------------------
    // FUNCTIONALITY STUFF
    // -------------------
    
    // Dismissing VC--through navBarItems
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Passing new times back to Sentence Search VC--through Done navBarItem
    func done() {
        self.delegate?.addNewLocation(chosenLocationString!, searchLocation: searchLocation!)
        dismiss()
    }

    

}