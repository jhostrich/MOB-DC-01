import Foundation

class Weather {
    
    /* let's strategize:
        so, we could create an object every time we want weather, but for this, not necessary to do that
        
    weather.retrieve
        --> weather.description
            weather.friendlyWeather
            weather.Fahrenheit
    
            label.text= weather...
    
        so, we're going to create a closure--we'll create a temporary variable in the closure, but then that object will go away as soon as closure is completed
            this is better for memory, etc
            the object is only in the context of the closure */
    
    
    var friendlyWeather: NSString?
    var fahrenheit: Float?
    
    init(json: NSDictionary) {
        if let weather = json["weather"] as? NSArray {
            if let firstWeather = weather[0] as? NSDictionary {
                if let description = firstWeather["description"] as? NSString {
                    self.friendlyWeather = description
                }
            }
        }
        
        if let main = json["main"] as? NSDictionary {
            if let temp = main["temp"] as? Float {
                // (K - 273.15) * 1.8 + 32
                self.fahrenheit = (temp - 273.15) * 1.8 + 32
            }
        }
        
    }
    
    class func retrieveWeather(userLoc: String, completionHandler:((Weather) -> Void)) {
    // the completionHandler is what gets and returns our data
    // so we want to enter a weather object and output a function
    
        
        if let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(userLoc)") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                
                if let weatherDict = NSJSONSerialization.JSONObjectWithData(data, options: .allZeros, error: nil) as? NSDictionary {
                    
                    // we're going to create our weather object that we can pass
                    // aka we're going to create an instance of a class inside itself
                    var weather = Weather(json: weatherDict)
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        completionHandler(weather)
                    })
                    
                }
            })
            task.resume()
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
}