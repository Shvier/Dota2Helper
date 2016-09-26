//
//  DHJournalModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/26/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHJournalModel: NSObject {

    var journalDescription: String?
    var title: String?
    var nid: String?
    var background: String?
    var time: String?
    var date: String?
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "description" {
            setValue(value, forKey: "journalDescription")
        }
    }
    
}
