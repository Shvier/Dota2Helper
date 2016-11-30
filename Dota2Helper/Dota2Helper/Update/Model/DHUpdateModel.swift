//
//  DHUpdateModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/26/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHUpdateModel: NSObject {

    var updateDescription: String?
    var title: String?
    var nid: String?
    var background: String?
    var time: String?
    var date: String?
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "description" {
            setValue(value, forKey: "updateDescription")
        }
    }
    
    init(dictionary: NSDictionary) {
        super.init()
        self.setValuesForKeys(dictionary as! [String : Any])
    }
    
}
