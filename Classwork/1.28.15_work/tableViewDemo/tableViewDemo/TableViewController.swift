//
//  TableViewController.swift
//  tableViewDemo
//
//  Created by Johanna Ostrich on 1/28/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, Campus {

    var gaCampuses = ["Washington DC", "New York", "Los Angeles", "Hong Kong", "Atlanta"]
   
    func addCampus(campusName: String) {
        self.gaCampuses.append(campusName)
    }
    
    @IBAction func addCampusButton(sender: AnyObject) {
        var secondVC = self.storyboard?.instantiateViewControllerWithIdentifier("secondVC") as SecondViewController
        secondVC.delegate = self
        // this is saying, the delegate we defined in SecondVC, have it apply here too
        // saying that delegate on secondVC is point to the first VC
        self.presentViewController(secondVC, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

   
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        // it's important to declare number of sections--if it's at 0, it won't show anything
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Sets the number of cells in the table to equal the number of items in our array
        return self.gaCampuses.count
    }
    
    // sweet, this is a convenience method--they've put this in the UITableViewController for us!
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
        
        // commitEditingStyle--so this is a convenience method set up for us--swipe to the left, and can delete
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.lightGrayColor()
        }
        
        cell.textLabel?.text = self.gaCampuses[indexPath.row]
        
        return cell
    }
    // this is basically a loop, and we populate it with the array index number
    // indexPath.row is the row we're at right now
    // there's actually also indexPath.section, but we only have 1 section right now, so no need to specify

    
    // table view already has some gestures set up for us, cause it's awesome
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.gaCampuses.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // here are more convenience methods from Apple
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
