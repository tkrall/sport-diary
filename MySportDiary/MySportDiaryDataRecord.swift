//
//  MySportDiaryDataRecord.swift
//  MySportDiary
//
//  Created by Koulutus on 19/01/16.
//  Copyright © 2016 Koulutus. All rights reserved.
//

import UIKit

struct MySportDiaryDataRecord {
    
    var mySportDiaryDate = String()
    var mySportDiarySport = String()
    var mySportDiaryDuration = String()
    var mySportDiaryPlace = String()
}

extension MySportDiaryDataRecord {
    
    static func MySportDiaryDataRecordOpenFileForSave()
    {
        print("MySportDiaryDataRecordOpenFileForSave called")
    }

    static func MySportDiaryDataRecordCloseFile()
    {
        print("MySportDiaryDataRecordCloseFile called")
    }
    
    static func MySportDiaryDataRecordSaveData(datarecord : MySportDiaryDataRecord)
    {
        print("MySportDiaryDataRecordSaveData called")
    }

    
}
