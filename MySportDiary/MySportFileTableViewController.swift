//
//  MySportFileTableViewController.swift
//  MySportDiary
//
//  Created by Koulutus on 03/01/16.
//  Copyright © 2016 Koulutus. All rights reserved.
//

import UIKit

class MySportFileTableViewController: UITableViewController {

    @IBAction func MySportFileCancelButton(sender: UIBarButtonItem) {
        // exit dialog
        dismissViewControllerAnimated(true, completion: {})
    }
    
    // Load file button handler
    @IBAction func MySportFileLoadButton(sender: UIButton) {
        // Check if the text field is empty
        if MySportFileLoadText.text == "" {
            let message = "Please give file name"
            let alertController = UIAlertController(title: "File name missing",
                message: message, preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default,
                handler: nil)
            alertController.addAction(okAction)
            
            self.presentViewController(alertController, animated: true,
                completion: nil)
        }
        else
        {
            // Open file and load data
            
            // Set new filename to global variable
            MySportRecordFilename = MySportFileLoadText.text!
            // Load actual data
            MySportDiaryDataRecord.MySportDiaryDataRecordLoadAll()
            
            // Refresh Table view elements
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
            
            // exit dialog
            dismissViewControllerAnimated(true, completion: {})
        }
        // NSCoder
        // NSKeyedUnarchiver
        // NSDate
    }
    
    @IBAction func MySportFileExportButton(sender: UIButton) {
        
        if MySportFileExportText.text == ""
        {
            let message = "Please give file name"
            let alertController = UIAlertController(title: "File name missing",
                message: message, preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default,
                handler: nil)
            alertController.addAction(okAction)
            
            self.presentViewController(alertController, animated: true,
                completion: nil)
        }
        else
        {
            // exit dialog
            dismissViewControllerAnimated(true, completion: {})
        }
    }
    
    @IBOutlet weak var MySportFileLoadText: UITextField!
    
    @IBOutlet weak var MySportFileExportText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let dummy = UITapGestureRecognizer(target: self, action: "MySportDiaryClearLoadDialog" )
        dummy.numberOfTapsRequired = 1
        self.MySportFileLoadText.addGestureRecognizer(dummy)
        
        let dummy2 = UITapGestureRecognizer(target: self, action: "MySportDiaryClearExportDialog" )
        dummy2.numberOfTapsRequired = 1
        self.MySportFileExportText.addGestureRecognizer(dummy2)
        
        // Clears the help text when user wants to edit
        MySportFileLoadText.clearsOnBeginEditing = true
        MySportFileExportText.clearsOnBeginEditing = true
    }

    func MySportDiaryClearLoadDialog()
    {
        // if tapped, clear the dialog and let user to type file name
        MySportFileLoadText.text = ""
    }
    
    func MySportDiaryClearExportDialog()
    {
        // if tapped, clear the dialog and let user to type file name
        MySportFileExportText.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
