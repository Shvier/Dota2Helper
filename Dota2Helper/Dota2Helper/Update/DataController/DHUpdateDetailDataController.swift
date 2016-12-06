//
//  DHUpdateDetailDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 26/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHUpdateDetailDataController: NSObject {
    
    func getUpdateDetail(date: String, nid: String, success: @escaping (_ urlString: String) -> Void, failure: @autoclosure @escaping () -> Void) {
        success(kGetNewsDetailUrl + date + "/" + nid)
    }
}
