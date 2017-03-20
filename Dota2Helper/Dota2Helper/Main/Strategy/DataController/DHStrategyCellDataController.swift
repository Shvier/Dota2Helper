//
//  DHStrategyCellDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 15/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHStrategyCellDataController: NSObject {

    static let sharedInstance = DHStrategyCellDataController()
    
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
    
    func loadMoreAllStrategies(nid: String, success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHLoadMoreStrategiesRequest.requestMoreAllStrategiesData(nid: nid, success: success, failure: failure)
    }
    
    func loadMoreNewerStrategies(nid: String, success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHLoadMoreStrategiesRequest.requestMoreNewerStrategiesData(nid: nid, success: success, failure: failure)
    }
    
    func loadMoreStepStrategies(nid: String, success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHLoadMoreStrategiesRequest.requestMoreStepStrategiesData(nid: nid, success: success, failure: failure)
    }
    
    func loadMoreSkillStrategies(nid: String, success: @escaping(_ reponse: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHLoadMoreStrategiesRequest.requestMoreSkillStrategiesData(nid: nid, success: success, failure: failure)
    }
    
    func getStrategiesDetail(date: String, nid: String, success: @escaping(_ urlString: String) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetNewsDetailRequest.requestNewsDetailData(date: date, nid: nid, success: success, failure: failure)
    }
    
}
