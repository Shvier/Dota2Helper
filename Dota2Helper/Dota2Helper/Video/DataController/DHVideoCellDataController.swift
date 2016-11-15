//
//  DHVideoCellDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 15/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHVideoCellDataController: NSObject {

    static let sharedInstance = DHVideoCellDataController()
    
    func getAllVideos(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetVideosRequest.requestAllVideosData(success: success, failure: failure)
    }
    
    func getJieshuoVideos(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetVideosRequest.requestJieshuoVideosData(success: success, failure: failure)
    }
    
    func getBisaiVideos(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetVideosRequest.requestBisaiVideosData(success: success, failure: failure)
    }
    
    func getCelebrityVideos(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetVideosRequest.requestCelebrityVideosData(success: success, failure: failure)
    }
    
    func getQuweiVideos(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetVideosRequest.requestQuweiVideosData(success: success, failure: failure)
    }
    
    func getBeginnerVideos(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetVideosRequest.requestBeginnerVideosData(success: success, failure: failure)
    }
    
    func getAdvancedVideos(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetVideosRequest.requestAdvancedVideosData(success: success, failure: failure)
    }
    
}
