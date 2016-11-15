//
//  DHTutorialDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 15/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHTutorialCellDataController: NSObject {

    static let sharedInstance = DHTutorialCellDataController()
    
    func getAllStrategies(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetStrategiesRequest.requestAllStrategiesData(success: success, failure: failure)
    }
    
    func getNewerStrategies(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetStrategiesRequest.requestNewerStrategiesData(success: success, failure: failure)
    }
    
    func getStepStrategies(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetStrategiesRequest.requestStepStrategiesData(success: success, failure: failure)
    }
    
    func getSkillStrategies(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetStrategiesRequest.requestSkillStrategiesData(success: success, failure: failure)
    }
    
}
