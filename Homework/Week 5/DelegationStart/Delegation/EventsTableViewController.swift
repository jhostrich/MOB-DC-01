//
//  EventsTableViewController.swift
//  Delegation
//
//  Created by Thomas Degry on 28/01/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController, EventProtocol {
    // event array
    var arrEvents:[Event] = []
    
    func addEvent(newEvent: Event) {
        self.arrEvents.append(newEvent)
    }

    @IBAction func addEventButton(sender: UIBarButtonItem) {
        let addEventVC = self.storyboard?.instantiateViewControllerWithIdentifier("addEventVC") as AddEventViewController
        let navigationController = UINavigationController(rootViewController: addEventVC)
        
        addEventVC.delegate = self
        
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrEvents.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath) as UITableViewCell
    
        let eventAtIndex = self.arrEvents[indexPath.row]
        cell.textLabel?.text = eventAtIndex.name
        cell.detailTextLabel?.text = eventAtIndex.location
        
        return cell
    }

    // ----- Enable deleting row -----
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.arrEvents.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    

}
