
import UIKit
import MapKit

// tells us where we are--used for tracking current phone
import CoreLocation

// this is to work with AddressBook--we'll use this to help convert lat/long to an address in a pretty way in func geocodeAddress
import AddressBookUI

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    // Simulator doesn't have GPS tracking, so when testing maps, best to do on iPhone, with something like Reflector app
    
    
    @IBOutlet weak var map: MKMapView!
    
    // manages our location
    let locman = CLLocationManager()
    
    // this is a default we're setting, so our initial zoom level will be the same
    // default increment is meters, about 2000 meters = 1 mile
    let searchRadius: CLLocationDistance = 1000
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.map.mapType = MKMapType.Standard
        // note: could also have self.map.mapType = .Standard
        
        let initialLocation = CLLocation(latitude: 38.9059246844043, longitude: -77.0405378379645)
        // can get long/lat points from Google Maps--I think once have pin
        
        // You need this line here if you want to display the initial location on the map
        self.centerMapOnLocation((initialLocation))
    
        // we're using this for MapKit, I think
        self.map.delegate = self
        
    
        // we're using this for CoreLocation, I think
        self.locman.delegate = self
        self.locman.desiredAccuracy = kCLLocationAccuracyBest
        // AccuracyBest is the best, but it takes up more space to run, so if don't need to use this one, don't
        // Best uses GPS and WiFi--GPS is much more accurate when WiFi available
        
        self.locman.activityType = CLActivityType.Fitness
        // .Fitness is a walking pattern
        // again, could just have self.locman.activityType = .Fitness
        
        self.locman.startUpdatingLocation()
        // I think this is working in coordination with func locationManager
    }

    
    func determineLocStatus() -> Bool {
        let isOk = CLLocationManager.locationServicesEnabled()
        if !isOk {
            return true
        }
        
        let status = CLLocationManager.authorizationStatus()
        switch status {
            case CLAuthorizationStatus.AuthorizedAlways, CLAuthorizationStatus.AuthorizedWhenInUse:
                return true
            
            case .NotDetermined:
                self.locman.requestWhenInUseAuthorization()
                return true
            
            case .Restricted:
                return false
                
            case .Denied:
                return false
        }
    }
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println("Updated location!")
        let loc = locations.last as CLLocation
        // so we're grabbing our most recent location--locations are set as array as updates, new one keeps getting appended to end
        
        let coordinates = loc.coordinate
        println("You are currently at \(coordinates.latitude), \(coordinates.longitude)")
        
        // accuracy at best is about 10 meters
        // iBeacons are super accurate--to the centimeter
            // Estimo sells iBeacons
    }
    
    
    // this centers our map where we are--it's a general function so we can use it again and again
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, self.searchRadius * 2.0, self.searchRadius * 2.0)
        self.map.setRegion(coordinateRegion, animated: true)
    }
    
    
    
    @IBAction func showCurrentLoction(sender: UIButton) {
        self.locman.requestWhenInUseAuthorization()
        
        // 3 different tracking modes--1 for walking/jogging/biking, 1 for driving, 1 for directions
        self.map.userTrackingMode = MKUserTrackingMode.Follow // follow is for walking
    }
    
    
    @IBAction func geocodeAddress(sender: UIButton) {
        let loc = self.map.userLocation.location
        if loc == nil {
            println("I don't know where you are, yo!")
            return // this return is saying if we've accessed this section, then stop--don't continue with code in rest of this function
        }
        
        let geocode = CLGeocoder()
        geocode.reverseGeocodeLocation(loc, completionHandler: {(placemarks: [AnyObject]!, error:NSError!) -> Void in
            // not every lat/long location in the world has an address, so first, we'll check to see if there's an address
            if placemarks != nil {
                let placemark = placemarks[0] as CLPlacemark
                
                // this isn't necessary, but it's a convenience method in AddressBookUI that makes things easy for us
                let address = ABCreateStringWithAddressDictionary(placemark.addressDictionary, false)
                println("You are at:\n\(address)")
            }
            
        })
    }
    
    
    @IBAction func findFood(sender: UIButton) {
        if !determineLocStatus() {
            println("Sorry, can't give you food because you disabled location")
            return
        }
        
        let userLoc = self.map.userLocation
        let loc = userLoc.location
        
        // checking in case user's phone has no GPS, no connection, whatever
        if loc == nil {
            println("I don't know where you are")
            return
        }
        
        let searchRequirements = MKLocalSearchRequest()
        searchRequirements.naturalLanguageQuery = "pizza"
        searchRequirements.region = self.map.region
        
        let search = MKLocalSearch(request: searchRequirements)
        search.startWithCompletionHandler { (response, error) -> Void in
            if response == nil {
                println(error)
            }
            
            // whenever we do a search, we can turn off our original marker--so it's not covering up results
            self.map.showsUserLocation = false
            
            // Feeling lucky!
            let pizzaPlace = response.mapItems[0] as MKMapItem
            // mapItems is the array of things we got back
            
            let place = pizzaPlace.placemark
            let loc = place.location.coordinate
            let region = MKCoordinateRegionMakeWithDistance(loc, 1200, 1200) // distance is radius
            self.map.setRegion(region, animated: true)
            let pizzaEna = MKPointAnnotation()
            pizzaEna.title = pizzaPlace.name
            pizzaEna.subtitle = pizzaPlace.phoneNumber
            pizzaEna.coordinate = loc
            // all this info comes from OpenMaps API--it's open source, so anyone can contribute--but Tedi says it's pretty behind GoogleMaps
            
            self.map.addAnnotation(pizzaEna)
            
            // or to be more clean, can set up Restaurant class and then do this
                // let restaurant = Restaurant(title: pizzaPlace.name, locationName: pizzaPlace.name, coordinate: loc)
                // self.map.addAnnotation(restaurant)
        }
        
    }
    
    
    @IBAction func getDirectionsToFood(sender: UIButton) {

    }
    
    
    @IBAction func showLocationInMapsApp(sender: UIButton) {
        let mapItem = MKMapItem.mapItemForCurrentLocation()
        
        // this is basically the delegate that sends map options to Apple Maps--can include more than one, of course--it's a dictionary
        mapItem.openInMapsWithLaunchOptions([MKLaunchOptionsMapTypeKey: MKMapType.Standard.rawValue])

    }
    



}

// Google Places API is apparently much richer, Tedi says--this is a good one to use

// it used to be that you could only ask user for permissions once
// in iOS8, you now can ask multiple times--Tedi thinks it's not an infinite number of times, though

