//
//  DHVideoDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 10/5/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHVideoDataController: NSObject {
    
    lazy var videoDataSource: NSMutableArray? = {[]} ()
    
    func requestVideoDataWithCallback( callback: @autoclosure @escaping () -> Swift.Void) {
        let url = URL(string: kRefreshVideos)
        let parameters: NSArray = ["all"]
        DHNetworkRequestManager.sharedInstance.requestWithUrl(type: .GET, urlHeader: url, parameters: parameters) { (Data, URLResponse, Error) in
            if Error == nil {
                do {
                    let result = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    let videoArray = result["videos"]
                    for videoDict in videoArray as! [NSDictionary] {
                        let video: DHVideoModel = DHVideoModel()
                        video.setValuesForKeys(videoDict as! [String : Any])
                        self.videoDataSource?.add(video)
                    }
                    callback()
                } catch {
                    DHLog("catch:\(URLResponse!)")
                }
            } else {
                DHLog("error:\(Error!)")
            }
        }
    }
    
}
