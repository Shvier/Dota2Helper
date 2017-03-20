//
//  DHNewsModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/18/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHNewsModel: NSObject {
    
    var background: String?;
    var date: String?;
    var newsDescription: String?;
    var nid: String?;
    var time: String?;
    var title: String?;
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "description" {
            setValue(value, forKey: "newsDescription")
        }
    }
    
    init(dictionary: NSDictionary) {
        super.init()
        self.setValuesForKeys(dictionary as! [String : Any])
    }
}
