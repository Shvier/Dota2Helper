//
//  DHGetVideoDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 04/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHGetVideoDataController {
    
    class func requestAllVideoData(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkController.request(url: kRefreshVideos + "all", parameters: nil, success: success, failure: failure)
    }
    
    class func requestJieshuoVideoData(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkController.request(url: kRefreshVideos + "jieshuo", parameters: nil, success: success, failure: failure)
    }
    
    class func requestBisaiVideoData(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkController.request(url: kRefreshVideos + "bisai", parameters: nil, success: success, failure: failure)
    }
    
    class func requestCelebrityVideoData(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkController.request(url: kRefreshVideos + "celebrity", parameters: nil, success: success, failure: failure)
    }
    
    class func requestQuweiVideoData(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkController.request(url: kRefreshVideos + "quwei", parameters: nil, success: success, failure: failure)
    }
    
    class func requestBeginnerVideoData(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkController.request(url: kRefreshVideos + "beginner", parameters: nil, success: success, failure: failure)
    }
    
    class func requestAdvancedVideoData(success: @autoclosure @escaping() -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkController.request(url: kRefreshVideos + "advanced", parameters: nil, success: success, failure: failure)
    }
    
}
