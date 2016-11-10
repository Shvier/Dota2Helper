//
//  UrlHeaders.swift
//  Dota2Helper
//
//  Created by Shvier on 04/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

let UrlHeader: String = "http://dota2xufserver.duapp.com/api/v1.0"

let DHAPIBatchRefreshNewsPath: String = "news/refresh"
func DHAPILoadMoreNewsPath(nid: String) -> String {
    return "news/loadmore/\(nid)"
}
func DHAPIGetNewsDetailPath(date: String, nid: String) -> String {
    return "newsdetail/\(date)/\(nid)"
}
let DHAPIBatchRefreshUpdatesUrl: String = "updates/refresh"
func DHAPILoadMoreUpdatesPath(nid: String) -> String {
    return "updates/loadmore/\(nid)"
}
let DHAPIBatchRefreshStrategiesPath: String = "strategy/refresh"
func DHAPILoadMoreStrategiesPath(strategyType: String, nid: String) -> String {
    return "strategy/loadmore/\(strategyType)/\(nid)"
}
let DHAPIBatchRefreshVideosPath: String = "video/refresh"
func DHAPILoadMoreVideosPath(videoType: String, nid: String) -> String {
    return "loadmore/\(videoType)/\(nid)"
}
func DHAPIGetVideoSetInfoPath(date: String, nid: String) -> String {
    return "videoset/\(date)/\(nid)"
}
func DHAPIGetYoukuVidPath(date: String, nid: String) -> String {
    return "youkuvid/\(date)/\(nid)"
}
// refresh news
let kRefreshNewsUrl: String = "http://dota2xufserver.duapp.com/api/v1.0/news/refresh"
// load more news
// loadmore/{nid}
let kLoadMoreNewsUrl: String = "http://dota2xufserver.duapp.com/api/v1.0/news/loadmore/"
// get news detail
// newsdetail/{date}/{nid}
let kGetNewsDetailUrl: String = "http://dota2xufserver.duapp.com/api/v1.0/newsdetail/"
// refresh updates
let kRefreshUpdatesUrl: String = "http://dota2xufserver.duapp.com/api/v1.0/updates/refresh"
// load more updates
// loadmore/{nid}
let kLoadMoreUpdatesUrl: String = "http://dota2xufserver.duapp.com/api/v1.0/updates/loadmore/"
// refresh strategies
let kRefreshStrategiesUrl: String = "http://dota2xufserver.duapp.com/api/v1.0/strategy/refresh/"
// load more strategies
// laodmore/{strategy_type}/{nid}
let kLoadMoreStrategiesUrl: String = "http://dota2xufserver.duapp.com/api/v1.0/strategy/loadmore/"
// refresh videos
let kRefreshVideos: String = "http://dota2xufserver.duapp.com/api/v1.0/video/refresh/"
// load more refresh videos
// loadmore/{video_type}/{vid}0
let kLoadMoreVideos: String = "http://dota2xufserver.duapp.com/api/v1.0/video/loadmore/"
// load more videos
// videoset/{date}/{vid}
let kGetVideoSetInfo: String = "http://dota2xuserver.duapp.com/api/v1.0/video/videoset/"
// get Youku vid
// youkuvid/{date}/{vid}
let kGetYoukuVidUrl: String = "http://dota2xuserver.duapp.com/api/v1.0/video/youkuvid/"

// get video detail info
let kGetVideoDetailInfoUrl: String = "http://openapi.youku.com/v2/videos/show.json"
// get relatedVideoList
let kGetRelatedVideoListUrl: String = "http://openapi.youku.com/v2/videos/by_related/json"
