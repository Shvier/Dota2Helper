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
    
    func requestVideoAllWithCallback(callback: @autoclosure @escaping () -> Void) {
        requestVideoDataWithCallback(callback: callback, videoType: "all")
    }
    
    func requestVideoJieshuoWithCallback(callback: @autoclosure @escaping () -> Void) {
        requestVideoDataWithCallback(callback: callback, videoType: "jieshuo")
    }
    
    func requestVideoBisaiWithCallback(callback: @autoclosure @escaping () -> Void) {
        requestVideoDataWithCallback(callback: callback, videoType: "bisai")
    }
    
    func requestVideoCelebrityWithCallback(callback: @autoclosure @escaping () -> Void) {
        requestVideoDataWithCallback(callback: callback, videoType: "celebrity")
    }
    
    func requestVideoQuweiWithCallback(callback: @autoclosure @escaping () -> Void) {
        requestVideoDataWithCallback(callback: callback, videoType: "quwei")
    }
    
    func requestVideoBeginnerWithCallback(callback: @autoclosure @escaping () -> Void) {
        requestVideoDataWithCallback(callback: callback, videoType: "beginner")
    }
    
    func requestVideoAdvancedWithCallback(callback: @autoclosure @escaping () -> Void) {
        requestVideoDataWithCallback(callback: callback, videoType: "advanced")
    }
    
    func requestVideoDataWithCallback(callback: @autoclosure @escaping () -> Void, videoType: String) {
        let url = URL(string: kRefreshVideos)
        let parameters: NSArray = [videoType]
        DHNetworkRequestManager.sharedInstance.requestWithUrl(type: .DEFAULT, urlHeader: url, parameters: parameters) { [unowned self] (Data, URLResponse, Error) in
            if Error == nil {
                do {
                    let result = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    let videoArray = result["videos"]
                    self.videoDataSource?.removeAllObjects()
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
    
    func requestMoreVideo( callback: @autoclosure @escaping () -> Void) {
        let url = URL(string: kLoadMoreVideos)
        let lastModel = videoDataSource![(videoDataSource?.count)! - 1] as! DHVideoModel
        let parameter: [String] = ["all", lastModel.vid!]
        DHNetworkRequestManager.sharedInstance.requestWithUrl(type: .DEFAULT, urlHeader: url, parameters: parameter) { [unowned self] (Data, URLResponse, Error) in
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
