//
//  DHHintManager.swift
//  Dota2Helper
//
//  Created by Shvier on 10/19/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

struct HintData {
    var imageName: String
    var hintContent: String
}

class DHHintManager: NSObject {
    
    static let sharedInstance = DHHintManager()
    
    let hintResource: NSArray = [
        ["name": "snk", "hint": "请等待网络重生，如果蓝量还够的话"],
        ["name": "sk", "hint": "电缆已被掘地穿刺挖断，什么？还有地震"],
        ["name": "fv", "hint": "似乎到了另一个时空维度"],
        ["name": "od", "hint": "该设备已被星体禁锢，无法与外界通信"],
        ["name": "sil", "hint": "网络通信已被沉默术士禁言，跟他谈谈吧"]
    ]
    
    let loadingResource: NSArray = [
        "",
        "",
        "",
        ""
    ]

    func getHint() -> HintData {
        let randIndex: Int = Int(arc4random_uniform(UInt32(hintResource.count)))
        let hintDict: NSDictionary = hintResource[randIndex] as! NSDictionary
        let hint: HintData = HintData(imageName: hintDict["name"] as! String + ".jpg", hintContent: hintDict["hint"] as! String)
        return hint
    }
    
}
