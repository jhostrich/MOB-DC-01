
import UIKit

// check it out--we need to import CoreData here too--anywhere we referene Core Data
import CoreData

class ViewController: UIViewController {

    // Our AppDelegate.swift file got a bunch of superpowers when we created our project with Core Data
    // when we want to use Core Data info, need to go through AppDelegate.swift...using this sweet baby:
    var appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let moc = self.appDelegate.managedObjectContext {
            
            // all right, now we need to create an object
            var ena = NSEntityDescription.insertNewObjectForEntityForName("Animal", inManagedObjectContext: moc) as Animal
            
            ena.name = "Ena"
            ena.numberOfLegs = 4
            ena.hasFur = true
            ena.noise = "Bark bark bark bark bark bark bark"
            
            // hurray! this is terrific! we want to make it official. so now we have to tell Core Data to save
            appDelegate.saveContext()
        }
    }

    @IBAction func loadAnimalData(sender: AnyObject) {
        if let moc = self.appDelegate.managedObjectContext {
            
            // we're fetching all the animals in our Animal entity, making them into an array
            let fetchAnimals = NSFetchRequest(entityName: "Animal")
            
            // Fetching -- it'll go into our entity and pull everything
            // if we want something specific, use filter
            
            // now we're going to create an array "animals" made up of instances of the class Animal
            // as?, because we're only typecasting if it exists
            if let animals: [Animal] = moc.executeFetchRequest(fetchAnimals, error: nil) as? [Animal] {
                for animal in animals {
                    println(animal.name)
                    println(animal.noise)
                    // Note: this will keep adding each time rerun application
                }
            }
            
            // what if I only want to search for Animals with name Tedi?
            
            // must add predicate before executing fetch request
            let animalPredicate = NSPredicate(format: "name contains %@", "edi")
            fetchAnimals.predicate = animalPredicate
            
            if let animals2: [Animal] = moc.executeFetchRequest(fetchAnimals, error: nil) as? [Animal] {
                for animal in animals2 {
                    println(animal.name)
                    println(animal.noise)
                    // Note: this will keep adding each time rerun application
                }
            }

            
        }
    }

    
    // Note: If have millions and millions of records--like FB--Core Data might slow down, so maybe Core Data isn't the best place to store stuff
    // so then better to go with an API, maybe
    
    // migration--importing data you already have into Core Data
    
}

