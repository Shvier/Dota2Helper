//
//  DHStrategyModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/30/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHStrategyModel: NSObject {

    var date: String?
    var title: String?
    var background: String?
    var nid: String?
    var strategyDescription: String?
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "description" {
            setValue(value, forKey: "strategyDescription")
        }
    }
    
    init(dictionary: NSDictionary) {
        super.init()
        setValuesForKeys(dictionary as! [String : Any])
    }
    
}
