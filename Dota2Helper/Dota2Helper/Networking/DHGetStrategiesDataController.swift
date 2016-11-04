//
//  DHGetStrategiesDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 04/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHGetStrategiesDataController {

    class func getAllStrategiesData(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkController.request(url: kRefreshStrategiesUrl + "all", parameters: nil, success: success, failure: failure)
    }
    
    class func getNewerStrategiesData(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkController.request(url: kRefreshStrategiesUrl + "newer", parameters: nil, success: success, failure: failure)
    }
    
    class func getStepStrategiesData(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkController.request(url: kRefreshStrategiesUrl + "step", parameters: nil, success: success, failure: failure)
    }
    
    class func getSkillStrategiesData(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkController.request(url: kRefreshStrategiesUrl + "skill", parameters: nil, success: success, failure: failure)
    }
    
}
