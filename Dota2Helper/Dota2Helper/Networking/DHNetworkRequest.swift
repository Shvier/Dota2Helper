//
//  DHNetworkRequest.swift
//  Dota2Helper
//
//  Created by Shvier on 05/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

//MARK: - News API
class DHGetNewsRequest {
    class func requestNewsData(success: @escaping (_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kRefreshNewsUrl, parameters: nil, success: success, failure: failure)
    }
}

class DHLoadMoreNewsRequest {
    class func requestMoreNewsData(nid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping() -> Void) {
        DHBaseNetworkRequest.request(url: kLoadMoreNewsUrl + nid, parameters: nil, success: success, failure: failure)
    }
}

class DHGetNewsDetailRequest {
    class func requestNewsDetailData(date: String, nid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kGetNewsDetailUrl + date + "/" + nid, parameters: nil, success: success, failure: failure)
    }
}

//MARK: - Updates API
class DHGetUpdatesRequest {
    class func requestUpdatesData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kRefreshUpdatesUrl, parameters: nil, success: success, failure: failure)
    }
}

class DHLoadMoreUpdatesRequest {
    class func requestMoreUpdatesData(nid: String, success: @autoclosure @escaping(Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kLoadMoreUpdatesUrl + nid, parameters: nil, success: success, failure: failure)
    }
}

//MARK: - Video API
class DHGetVideosRequest {
    class func requestAllVideosData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kRefreshVideos + "all", parameters: nil, success: success, failure: failure)
    }
    
    class func requestJieshuoVideosData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kRefreshVideos + "jieshuo", parameters: nil, success: success, failure: failure)
    }
    
    class func requestBisaiVideosData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kRefreshVideos + "bisai", parameters: nil, success: success, failure: failure)
    }
    
    class func requestCelebrityVideosData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kRefreshVideos + "celebrity", parameters: nil, success: success, failure: failure)
    }
    
    class func requestQuweiVideosData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kRefreshVideos + "quwei", parameters: nil, success: success, failure: failure)
    }
    
    class func requestBeginnerVideosData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kRefreshVideos + "beginner", parameters: nil, success: success, failure: failure)
    }
    
    class func requestAdvancedVideosData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kRefreshVideos + "advanced", parameters: nil, success: success, failure: failure)
    }
}

class DHLoadMoreVideosRequest {
    class func requestMoreAllVideosData(vid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kLoadMoreVideos + "all" + "/" + vid, parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreJieshuoVideosData(vid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kLoadMoreVideos + "jieshuo" + "/" + vid, parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreBisaiVideosData(vid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kLoadMoreVideos + "bisai" + "/" + vid, parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreCelebrityVideosData(vid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kLoadMoreVideos + "celebrity" + "/" + vid, parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreQuweiVideosData(vid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kLoadMoreVideos + "quwei" + "/" + vid, parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreBeginnerVideosData(vid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kLoadMoreVideos + "beginner" +  "/" + vid, parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreAdvancedVideosData(vid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kLoadMoreVideos + "advanced" + "/" + vid, parameters: nil, success: success, failure: failure)
    }
}

class DHGetRelatedVideosRequest {
    class func requestRelatedVideosData(vid: String, count: Int = 10, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kGetRelatedVideoListUrl, parameters: ["client_id": kYoukuClientId, "video_id": vid, "count": count], success: success, failure: failure)
    }
}

//MARK: - Strategies API
class DHGetStrategiesRequest {
    class func requestAllStrategiesData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kRefreshStrategiesUrl + "all", parameters: nil, success: success, failure: failure)
    }
    
    class func requestNewerStrategiesData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kRefreshStrategiesUrl + "newer", parameters: nil, success: success, failure: failure)
    }
    
    class func requestStepStrategiesData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kRefreshStrategiesUrl + "step", parameters: nil, success: success, failure: failure)
    }
    
    class func requestSkillStrategiesData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kRefreshStrategiesUrl + "skill", parameters: nil, success: success, failure: failure)
    }
}

class DHLoadMoreStrategiesRequest {
    class func requestMoreAllStrategiesData(nid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kLoadMoreStrategiesUrl + "all" + "/" + nid, parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreNewerStrategiesData(nid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kLoadMoreStrategiesUrl + "newer" + "/" + nid, parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreStepStrategiesData(nid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kLoadMoreStrategiesUrl + "step" + "/" + nid, parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreSkillStrategiesData(nid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: kLoadMoreStrategiesUrl + "skill" + "/" + nid, parameters: nil, success: success, failure: failure)
    }
}
