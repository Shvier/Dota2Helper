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
        DHBaseNetworkRequest.request(url: DHAPIBatchRefreshNewsUrl, parameters: nil, success: success, failure: failure)
    }
}

class DHLoadMoreNewsRequest {
    class func requestMoreNewsData(nid: String, success: @escaping (_ response: Data) -> Void, failure: @autoclosure @escaping() -> Void) {
        DHBaseNetworkRequest.request(url: DHAPILoadMoreNewsUrl(nid: nid), parameters: nil, success: success, failure: failure)
    }
}

class DHGetNewsDetailRequest {
    class func requestNewsDetailData(date: String, nid: String, success: @escaping (_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPIGetNewsDetailUrl(date: date, nid: nid), parameters: nil, success: success, failure: failure)
    }
}

//MARK: - Updates API
class DHGetUpdatesRequest {
    class func requestUpdatesData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPIBatchRefreshUpdatesUrl, parameters: nil, success: success, failure: failure)
    }
}

class DHLoadMoreUpdatesRequest {
    class func requestMoreUpdatesData(nid: String, success: @autoclosure @escaping(Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPILoadMoreUpdatesUrl(nid: nid), parameters: nil, success: success, failure: failure)
    }
}

//MARK: - Video API
class DHGetVideosRequest {
    class func requestAllVideosData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPIGetRefreshVideosUrl(videoType: "all"), parameters: nil, success: success, failure: failure)
    }
    
    class func requestJieshuoVideosData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPIGetRefreshVideosUrl(videoType: "jieshuo"), parameters: nil, success: success, failure: failure)
    }
    
    class func requestBisaiVideosData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPIGetRefreshVideosUrl(videoType: "bisai"), parameters: nil, success: success, failure: failure)
    }
    
    class func requestCelebrityVideosData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPIGetRefreshVideosUrl(videoType: "celebrity"), parameters: nil, success: success, failure: failure)
    }
    
    class func requestQuweiVideosData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPIGetRefreshVideosUrl(videoType: "quwei"), parameters: nil, success: success, failure: failure)
    }
    
    class func requestBeginnerVideosData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPIGetRefreshVideosUrl(videoType: "beginner"), parameters: nil, success: success, failure: failure)
    }
    
    class func requestAdvancedVideosData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPIGetRefreshVideosUrl(videoType: "advanced"), parameters: nil, success: success, failure: failure)
    }
}

class DHLoadMoreVideosRequest {
    class func requestMoreAllVideosData(vid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPILoadMoreVideosUrl(videoType: "all", vid: vid), parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreJieshuoVideosData(vid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPILoadMoreVideosUrl(videoType: "jieshuo", vid: vid), parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreBisaiVideosData(vid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPILoadMoreVideosUrl(videoType: "bisai", vid: vid), parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreCelebrityVideosData(vid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPILoadMoreVideosUrl(videoType: "celebrity", vid: vid), parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreQuweiVideosData(vid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPILoadMoreVideosUrl(videoType: "quwei", vid: vid), parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreBeginnerVideosData(vid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPILoadMoreVideosUrl(videoType: "beginner", vid: vid), parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreAdvancedVideosData(vid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPILoadMoreVideosUrl(videoType: "advanced", vid: vid), parameters: nil, success: success, failure: failure)
    }
}

class DHGetRelatedVideosRequest {
    class func requestRelatedVideosData(vid: String, count: Int = 10, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPIGetRelatedVideoListUrl, parameters: ["client_id": kYoukuClientId, "video_id": vid, "count": count], success: success, failure: failure)
    }
}

//MARK: - Strategies API
class DHGetStrategiesRequest {
    class func requestAllStrategiesData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPIRefreshStrategiesUrl(strategiesType: "all"), parameters: nil, success: success, failure: failure)
    }
    
    class func requestNewerStrategiesData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPIRefreshStrategiesUrl(strategiesType: "newer"), parameters: nil, success: success, failure: failure)
    }
    
    class func requestStepStrategiesData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPIRefreshStrategiesUrl(strategiesType: "step"), parameters: nil, success: success, failure: failure)
    }
    
    class func requestSkillStrategiesData(success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPIRefreshStrategiesUrl(strategiesType: "skill"), parameters: nil, success: success, failure: failure)
    }
}

class DHLoadMoreStrategiesRequest {
    class func requestMoreAllStrategiesData(nid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPILoadMoreStrategiesUrl(strategyType: "all", nid: nid), parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreNewerStrategiesData(nid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPILoadMoreStrategiesUrl(strategyType: "newer", nid: nid), parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreStepStrategiesData(nid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPILoadMoreStrategiesUrl(strategyType: "step", nid: nid), parameters: nil, success: success, failure: failure)
    }
    
    class func requestMoreSkillStrategiesData(nid: String, success: @autoclosure @escaping (Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHBaseNetworkRequest.request(url: DHAPILoadMoreStrategiesUrl(strategyType: "skill", nid: nid), parameters: nil, success: success, failure: failure)
    }
}
