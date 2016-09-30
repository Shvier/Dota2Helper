//
//  DHTutorialModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/30/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHTutorialModel: NSObject {

    var date: String?
    var title: String?
    var background: String?
    var nid: String?
    var tutorialDescription: String?
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "description" {
            setValue(value, forKey: "tutorialDescription")
        }
    }
    
}
