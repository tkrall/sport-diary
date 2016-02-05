//
//  MySportDiaryMainTableViewController.swift
//  MySportDiary
//
//  Created by Koulutus on 30/12/15.
//  Copyright © 2015 Koulutus. All rights reserved.
//

import UIKit

let reuseIdentifier = "MySportDiaryDataCell"

var mySportRecordsArray = [MySportDiaryDataRecord]()


class MySportDiaryMainTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //let data = MySportDiaryDataRecord(mySportDiaryDate: "Test",mySportDiarySport: "Test",mySportDiaryDuration: "Test",mySportDiaryPlace: "Test")
        //mySportRecordsArray.append(data)
        
        // Load existing records if present. Filename is in variable 'MySportRecordFilename'
        MySportDiaryDataRecord.MySportDiaryDataRecordLoadAll()

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // This function will finally update the view!
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
        self.reloadInputViews()
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySportRecordsArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MySportDiaryDataCell

        // Configure the cell...
        //cell.textLabel?.text = mySportRecordsArray[(indexPath.row)].mySportDiaryDate
        
        let cell = UITableViewCell()
        let label = UILabel(frame: CGRect(x:0, y:0, width:200, height:50))
        label.text = mySportRecordsArray[(indexPath.row)].mySportDiaryDate
        cell.addSubview(label)
        let label2 = UILabel(frame: CGRect(x:200, y:0, width:200, height:50))
        label2.text = mySportRecordsArray[(indexPath.row)].mySportDiarySport
        cell.addSubview(label2)
        
        // Add delete button to element
        let deleteButton = UIButton(type: UIButtonType.Custom)
        deleteButton.setTitle("Del", forState: UIControlState.Normal)
        deleteButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        deleteButton.frame = CGRectMake(400, 0, 50, 50)
        deleteButton.addTarget(self, action: "MySportDiaryDelAction:", forControlEvents: UIControlEvents.TouchUpInside)
        deleteButton.tag = indexPath.row
        cell.addSubview(deleteButton)
        
        // Add edit button to element
        let editButton = UIButton(type: UIButtonType.Custom)
        editButton.setTitle("Edit", forState: UIControlState.Normal)
        editButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        editButton.frame = CGRectMake(450, 0, 50, 50)
        editButton.addTarget(self, action: "MySportDiaryEditAction:", forControlEvents: UIControlEvents.TouchUpInside)
        editButton.tag = indexPath.row
        cell.addSubview(editButton)
        return cell
    }


    override func tableView(tableView: (UITableView!), heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func MySportDiaryDelAction(sender:UIButton!)
    {
        let buttonRow = sender.tag
        print("MySportDiaryDelAction: button in row pressed", buttonRow)
        
        // Remove correct element from local store
        mySportRecordsArray.removeAtIndex(buttonRow)
        
        // Update data to file system
        MySportDiaryDataRecord.MySportDiaryDataRecordSaveData(mySportRecordsArray)
        
        // Make sure that Table view elements are updated
        dispatch_async(dispatch_get_main_queue()) {
            self.tableView.reloadData()
        }

    }
    
    func MySportDiaryEditAction(sender:UIButton!)
    {
        let buttonRow = sender.tag
        print("MySportDiaryEditAction: button in row pressed", buttonRow)
    }
    
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
