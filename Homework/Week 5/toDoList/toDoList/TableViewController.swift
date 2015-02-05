//
//  TableViewController.swift
//  toDoList
//
//  Created by Johanna Ostrich on 1/28/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, NewToDo {

    var toDoList = ["Wake up", "Eat breakfast", "Brush my teeth", "Go to work", "Be productive"]
    
    func addToDoItem(toDoName: String) {
        self.toDoList.append(toDoName)
    }

    @IBAction func showModal(sender: UIBarButtonItem) {
        let addVC = self.storyboard?.instantiateViewControllerWithIdentifier("addVC") as AddViewController
        
        addVC.delegate = self
        
        self.presentViewController(addVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

   
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toDoList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath) as UITableViewCell
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.lightGrayColor()
            cell.textLabel?.textColor = UIColor.whiteColor()
        }
        
        cell.textLabel?.text = self.toDoList[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.toDoList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }


}
