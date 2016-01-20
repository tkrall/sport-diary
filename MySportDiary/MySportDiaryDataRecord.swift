//
//  MySportDiaryDataRecord.swift
//  MySportDiary
//
//  Created by Koulutus on 19/01/16.
//  Copyright © 2016 Koulutus. All rights reserved.
//

import UIKit

private var MySportRecordFilename = "mysportrecord.txt"

class MySportDiaryDataRecord : NSObject, NSCoding {
    
    var mySportDiaryDate = String()
    var mySportDiarySport = String()
    var mySportDiaryDuration = String()
    var mySportDiaryPlace = String()
    
    init( mySportDiaryDate: String, mySportDiarySport: String, mySportDiaryDuration: String, mySportDiaryPlace: String ) {
        self.mySportDiaryDate = mySportDiaryDate
        self.mySportDiarySport = mySportDiarySport
        self.mySportDiaryDuration = mySportDiaryDuration
        self.mySportDiaryPlace = mySportDiaryPlace
        }
    
    override init() {
        super.init()
        
    }

    // NSCoding decode/encode functions for data element
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.mySportDiaryDate = aDecoder.decodeObjectForKey("mySportDiaryDate") as! String
        self.mySportDiarySport = aDecoder.decodeObjectForKey("mySportDiarySport") as! String
        self.mySportDiaryDuration = aDecoder.decodeObjectForKey("mySportDiaryDuration") as! String
        self.mySportDiaryPlace = aDecoder.decodeObjectForKey("mySportDiaryPlace") as! String
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.mySportDiaryDate, forKey: "mySportDiaryDate")
        coder.encodeObject(self.mySportDiarySport, forKey: "mySportDiarySport")
        coder.encodeObject(self.mySportDiaryDuration, forKey: "mySportDiaryDuration")
        coder.encodeObject(self.mySportDiaryPlace, forKey: "mySportDiaryPlace")
    }

}

extension MySportDiaryDataRecord {
    
    static func MySportDiaryDataRecordSaveData(datarecord : MySportDiaryDataRecord)
    {
        print("MySportDiaryDataRecordSaveData called")
        
        let myFileDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        // Add file name
        let myDirectoryString = myFileDirectory[0] as NSString
        let myFilePosition = myDirectoryString.stringByAppendingPathComponent(MySportRecordFilename)
        
        NSKeyedArchiver.archiveRootObject(datarecord, toFile: myFilePosition)
    }

}

/*

    @IBAction func LoadAllAction(sender: UIButton) {
        
        // Use default file manager
        let myFileManager = NSFileManager.defaultManager()
        
        // search document directory
        // hard coded to be first one
        let myFileDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        // Add file name
        let myDirectoryString = myFileDirectory[0] as String
        
        let myFilePosition = myDirectoryString.stringByAppendingString("myTest.text")
        
        
        // remember to check that there is a correct file to load from
        if myFileManager.fileExistsAtPath(myFilePosition)
        {
            // file exists open it and read
            let receivedData = NSKeyedUnarchiver.unarchiveObjectWithFile(myFilePosition) as! MyData
            FirstNameField.text = receivedData.MyFamilyName
            FamilyNameField.text = receivedData.MyFirstName
            
        }
    }

   */

