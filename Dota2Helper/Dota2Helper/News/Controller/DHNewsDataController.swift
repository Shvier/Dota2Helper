//
//  DHNewsDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/19/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHNewsDataController: NSObject {

    lazy var newsDataSource: NSMutableArray? = {[]} ()
    lazy var bannerDataSource: NSMutableArray? = {[]} ()
    
    func requestNewsDataWithCallback( callback: @autoclosure @escaping () -> Swift.Void) {
        let url = URL(string: kRefreshNewsUrl)
        DHNetworkRequestManager.sharedInstance.requestWithUrl(type: .POST, urlHeader: url, parameters: nil) { (Data, URLResponse, Error) in
            if Error == nil {
                do {
                    let result = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    let bannerArray = result["banner"]
                    let newsArray = result["news"]
                    for bannerDict in bannerArray as! [NSDictionary] {
                        let banner: DHNewsModel = DHNewsModel()
                        banner.setValuesForKeys(bannerDict as! [String : Any])
                        self.bannerDataSource?.add(banner)
                    }
                    for newsDict in newsArray as! [NSDictionary] {
                        let news: DHNewsModel = DHNewsModel()
                        news.setValuesForKeys(newsDict as! [String : Any])
                        self.newsDataSource?.add(news)
                    }
                    callback()
                    print((self.newsDataSource?[(self.newsDataSource?.count)!-1] as! DHNewsModel).nid)
                } catch {
                    DHLog("catch:\(URLResponse!)")
                }
            } else {
                DHLog("error:\(Error!)")
            }
        }
    }
    
    func requestMoreNews( callback: @autoclosure @escaping () -> Void) {
        
    }
    
}
