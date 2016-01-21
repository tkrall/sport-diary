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

    static func MySportDiaryDataRecordLoadAll()
    {
        // Use default file manager
        let myFileManager = NSFileManager.defaultManager()
        
        // search document directory
        // hard coded to be first one
        let myFileDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        // Add file name
        let myDirectoryString = myFileDirectory[0] as String
        
        // Add file name to path
        let myFilePosition = myDirectoryString.stringByAppendingString(MySportRecordFilename)
        
        if myFileManager.fileExistsAtPath(myFilePosition)
        {
            // file exists open it and read
            let receivedSportData = NSKeyedUnarchiver.unarchiveObjectWithFile(myFilePosition) as! [MySportDiaryDataRecord]
            
            // Restore record to global variable. Ensure that empty record is not copied
            if receivedSportData.count > 0
            {
            mySportRecordsArray = receivedSportData
            }
            else
            {
                print("MySportDiaryDataRecordLoadAll: No records")
            }
        }
        else
        {
            print("MySportDiaryDataRecordLoadAll: File not found")
        }
    }
}
