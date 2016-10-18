//
//  Constrants.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/15.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit

let kThemeColor = UIColor(red:0.71, green:0.51, blue:0.39, alpha:1.00)

let kScreenWidth = UIScreen.main.bounds.size.width

let kYoukuClientId: String = "2f9d050663c87f13"
let kYoukuClientSecret: String = "bc01abf455c8c702f11eb7217344ce78"

let kNavigationHeight: CGFloat = 44
let kNewsCellReuseIdentifier: String = "NewsTableViewCell"
let kJournalCellReuseIdentifier: String = "JournalTableViewCell"
let kTutorialCellReuseIdentifier: String = "TutorialTableViewCell"
let kVideoCellReuseIdentifier: String = "VideoTableViewCell"
let kSettingCellReuseIdentifier: String = "SettingTableViewCell"

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
// loadmore/{video_type}/{vid}
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

func DHLog<T>(_ message: T,
                 file: String = #file,
               method: String = #function,
                 line: Int = #line) {
    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
}
