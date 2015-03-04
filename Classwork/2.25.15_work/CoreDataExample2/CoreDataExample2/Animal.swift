
import Foundation

// Core Data still needs to talk to some Objective C classes
import CoreData

// we also need to create a bridge from our class into Objective C--to port our class into Objective C
// allows us to use this class as a Managed Object
@objc(Animal)


class Animal: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var numberOfLegs: Int32
    @NSManaged var hasFur: Bool
    @NSManaged var noise: String
    
    // @NSManaged is tying these properties to our managed attributes
    
    // so we just tied our class to our entity--hells yeah!
    // don't forget, after we created this class, we also had to go back to our entity and tie it up with this class (just like do in Storyboard)
    
}