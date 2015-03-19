//
//  ViewController.swift
//  openWeather
//
//  Created by Johanna Ostrich on 3/9/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherDescription: UILabel!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var stateTextField: UITextField!
    
    @IBOutlet weak var weatherTemp: UILabel!
    
    @IBAction func updateButton(sender: AnyObject) {
        // weatherDescription.text = "Loading..."
        // sleep(2)
        //getWeather(self.cityTextField.text + "," + self.stateTextField.text)
        Weather.retrieveWeather(self.cityTextField.text + "," + self.stateTextField.text) { (weather) -> Void in
            // what will come back to us will be in parameter tempWeather
            // this is basically a tunnel, with info coming through the void, I think
            
            self.weatherDescription.text = weather.friendlyWeather
            println("The temp is \(weather.fahrenheit)")
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Weather.retrieveWeather("washington,dc") { (weather) -> Void in
            self.weatherDescription.text = weather.friendlyWeather
            
        }
        
    }
    
    
//    func getWeather(locationToLoad: String) {
//        if let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(locationToLoad)") {
//            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
//                
//                if let weatherDict = NSJSONSerialization.JSONObjectWithData(data, options: .allZeros, error: nil) as? NSDictionary {
//                    if let weather  = weatherDict["weather"] as? NSArray {
//                        if let firstItem = weather[0] as? NSDictionary {
//                            if let description = firstItem["description"] as? NSString {
//                                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                                    self.weatherDescription.text = description
//                                    
//                                    
//                                })
//                            }
//                        }
//                    }
//                }
//            })
//            task.resume()
//        }
//
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

