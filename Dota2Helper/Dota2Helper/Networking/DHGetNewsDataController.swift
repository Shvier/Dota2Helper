//
//  DHGetNewsDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 04/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHGetNewsDataController {
    
    class func requestNewsData(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkController.request(url: kRefreshNewsUrl, parameters: nil, success: success, failure: failure)
    }
    
}
