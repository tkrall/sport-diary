//
//  MySportEntryTableViewController.swift
//  MySportDiary
//
//  Created by Koulutus on 29/12/15.
//  Copyright © 2015 Koulutus. All rights reserved.
//

import UIKit


class MySportEntryTableViewController: UITableViewController {
    
    
    @IBAction func SportDiaryCancelButton(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: {})
    }

    @IBAction func SportDiarySaveButton(sender: UIBarButtonItem) {
        
        let data = MySportDiaryDataRecord(mySportDiaryDate: MySportDiaryDateText.text!, mySportDiarySport: MySportDiarySportText.text!, mySportDiaryDuration: MySportDiaryDurationText.text!, mySportDiaryPlace: MySportDiaryDurationText.text! )
        
        mySportRecordsArray.append(data)
        
        // Store data
        MySportDiaryDataRecord.MySportDiaryDataRecordSaveData(data)
        
        dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
        }
        
        dismissViewControllerAnimated(true, completion: {})
    }
    
    // Text inputs
    @IBOutlet weak var MySportDiaryDateText: UITextField!
    
    @IBOutlet weak var MySportDiarySportText: UITextField!
    
    @IBOutlet weak var MySportDiaryDurationText: UITextField!
    
    @IBOutlet weak var MySportDiaryPlaceText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 // hard coded, check this
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4 // hard coded, check this
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
