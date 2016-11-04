//
//  DHGetUpdatesDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 04/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHGetUpdatesDataController {

    class func requestUpdateData(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkController.request(url: kRefreshUpdatesUrl, parameters: nil, success: success, failure: failure)
    }
    
}
