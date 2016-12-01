//
//  DHStrategyDetailDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHStrategyDetailDataController: NSObject {
    
    static let sharedInstance = DHStrategyDetailDataController()
    
    func getStrategyDetail(date: String, nid: String, success: @escaping (_ urlString: String) -> Void, failure: @autoclosure @escaping () -> Void) {
        success(kGetNewsDetailUrl + date + "/" + nid)
    }

}
