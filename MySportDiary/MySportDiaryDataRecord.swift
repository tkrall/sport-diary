//
//  MySportDiaryDataRecord.swift
//  MySportDiary
//
//  Created by Koulutus on 19/01/16.
//  Copyright © 2016 Koulutus. All rights reserved.
//

import UIKit

var MySportRecordFilename = "mysportrecord.txt"

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
        super.init()
        }
    
    override init() {
        super.init()
        
    }

    // NSCoding decode/encode functions for data element
    required convenience init?(coder aDecoder: NSCoder) {
        let decodedmySportDiaryDate = aDecoder.decodeObjectForKey("mySportDiaryDate") as! String
        let decodedmySportDiarySport = aDecoder.decodeObjectForKey("mySportDiarySport") as! String
        let decodedmySportDiaryDuration = aDecoder.decodeObjectForKey("mySportDiaryDuration") as! String
        let decodedmySportDiaryPlace = aDecoder.decodeObjectForKey("mySportDiaryPlace") as! String
        self.init(mySportDiaryDate: decodedmySportDiaryDate, mySportDiarySport: decodedmySportDiarySport, mySportDiaryDuration: decodedmySportDiaryDuration, mySportDiaryPlace: decodedmySportDiaryPlace)
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.mySportDiaryDate, forKey: "mySportDiaryDate")
        coder.encodeObject(self.mySportDiarySport, forKey: "mySportDiarySport")
        coder.encodeObject(self.mySportDiaryDuration, forKey: "mySportDiaryDuration")
        coder.encodeObject(self.mySportDiaryPlace, forKey: "mySportDiaryPlace")
    }

}

extension MySportDiaryDataRecord {
    
    static func MySportDiaryDataRecordSaveData(datarecords : [MySportDiaryDataRecord])
    {
        print("MySportDiaryDataRecordSaveData called")
        
        let myFileDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        // Add file name
        let myDirectoryString = myFileDirectory[0] as NSString
        let myFilePosition = myDirectoryString.stringByAppendingPathComponent(MySportRecordFilename)
        
        NSKeyedArchiver.archiveRootObject(datarecords, toFile: myFilePosition)
        
        //NSUserDefaults.standardUserDefaults().setObject(dataElements, forKey: "MySportRecordsInUserDefaults")
        
        //NSUserDefaults.standardUserDefaults().synchronize()
    }

    static func MySportDiaryDataRecordLoadAll()
    {
        // Use default file manager
        let myFileManager = NSFileManager.defaultManager()
        
        // search document directory
        // hard coded to be first one
        let myFileDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        // Add file name
        var myDirectoryString = myFileDirectory[0] as String
        // Add separator '/'
        myDirectoryString = myDirectoryString.stringByAppendingString("/")
        
        // Add file name to path
        let myFilePosition = myDirectoryString.stringByAppendingString(MySportRecordFilename)
        
        if myFileManager.fileExistsAtPath(myFilePosition)
        {
            // file exists open it and read
            let receivedSportData = NSKeyedUnarchiver.unarchiveObjectWithFile(myFilePosition) as? [MySportDiaryDataRecord]
            
            if (receivedSportData != nil)
            {
                // Restore record to global variable.
                
                print("MySportDiaryDataRecordLoadAll: data records updated")
                mySportRecordsArray = receivedSportData!
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
