//
//  UrlHeaders.swift
//  Dota2Helper
//
//  Created by Shvier on 04/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

let UrlHeader: String = "http://dota2xufserver.duapp.com/api/v1.0/"
// refresh news
let DHAPIBatchRefreshNewsUrl: String = UrlHeader + "news/refresh"
// load more news
func DHAPILoadMoreNewsUrl(nid: String) -> String {
    return UrlHeader + "news/loadmore/\(nid)"
}
// get news detail
func DHAPIGetNewsDetailUrl(date: String, nid: String) -> String {
    return UrlHeader + "newsdetail/\(date)/\(nid)"
}
// refresh update
let DHAPIBatchRefreshUpdateUrl: String = UrlHeader + "updates/refresh"
// load more updates
func DHAPILoadMoreUpdateUrl(nid: String) -> String {
    return UrlHeader + "updates/loadmore/\(nid)"
}
// refresh strategies
func DHAPIRefreshStrategiesUrl(strategiesType: String) -> String {
    return UrlHeader + "strategy/refresh/\(strategiesType)"
}
// load more strategies
func DHAPILoadMoreStrategiesUrl(strategyType: String, nid: String) -> String {
    return UrlHeader + "strategy/loadmore/\(strategyType)/\(nid)"
}
// refresh videos
func DHAPIGetRefreshVideosUrl(videoType: String) -> String {
    return UrlHeader + "video/refresh/\(videoType)"
}
// load more videos
func DHAPILoadMoreVideosUrl(videoType: String, vid: String) -> String {
    return UrlHeader + "video/loadmore/\(videoType)/\(vid)"
}
// get video set info
func DHAPIGetVideoSetInfoUrl(date: String, vid: String) -> String {
    return UrlHeader + "videoset/\(date)/\(vid)"
}
// get youku vid
func DHAPIGetYoukuVidUrl(date: String, vid: String) -> String {
    return UrlHeader + "youkuvid/\(date)/\(vid)"
}
// get relatedVideoList
let DHAPIGetRelatedVideoListUrl: String = "http://openapi.youku.com/v2/videos/by_related/json"

let kRefreshNewsUrl: String = "http://dota2xufserver.duapp.com/api/v1.0/news/refresh"
let kLoadMoreNewsUrl: String = "http://dota2xufserver.duapp.com/api/v1.0/news/loadmore/"
let kGetNewsDetailUrl: String = "http://dota2xufserver.duapp.com/api/v1.0/newsdetail/"
let kRefreshUpdatesUrl: String = "http://dota2xufserver.duapp.com/api/v1.0/updates/refresh"
let kLoadMoreUpdatesUrl: String = "http://dota2xufserver.duapp.com/api/v1.0/updates/loadmore/"
let kRefreshStrategiesUrl: String = "http://dota2xufserver.duapp.com/api/v1.0/strategy/refresh/"
let kLoadMoreStrategiesUrl: String = "http://dota2xufserver.duapp.com/api/v1.0/strategy/loadmore/"
let kRefreshVideos: String = "http://dota2xufserver.duapp.com/api/v1.0/video/refresh/"
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
