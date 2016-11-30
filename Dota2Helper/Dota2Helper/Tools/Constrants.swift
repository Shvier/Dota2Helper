//
//  Constrants.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/15.
//  Copyright © 2016年 Shvier. All rights reserved.
//

let kTimeOut: UInt64 = 10

let kThemeColor = UIColor(red:0.71, green:0.51, blue:0.39, alpha:1.00)
//let kThemeColor = UIColor(red:1.00, green:0.91, blue:0.85, alpha:1.00)
let kTabBarItemColor = UIColor(red:1.00, green:0.00, blue:0.00, alpha:1.00)
let kTableViewBackgroundColor = UIColor(red:0.87, green:0.87, blue:0.87, alpha:1.00)

let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

let kYoukuClientId: String = "2f9d050663c87f13"
let kYoukuClientSecret: String = "bc01abf455c8c702f11eb7217344ce78"

let kSegmentedMenuHeight: CGFloat = 50
let kNavigationHeight: CGFloat = 44
let kStatusBarHeight: CGFloat = 20
let kTabBarHeight: CGFloat = 49
let kNewsCellReuseIdentifier: String = "NewsTableViewCell"
let kUpdateCellReuseIdentifier: String = "UpdateTableViewCell"
let kStrategyCellReuseIdentifier: String = "StrategyTableViewCell"
let kVideoCellReuseIdentifier: String = "VideoTableViewCell"
let kSettingCellReuseIdentifier: String = "SettingTableViewCell"
let kSDKCellReuseIdentifier: String = "SDKTableViewCell"

func DHLog<T>(_ message: T,
                 file: String = #file,
               method: String = #function,
                 line: Int = #line) {
    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
}
