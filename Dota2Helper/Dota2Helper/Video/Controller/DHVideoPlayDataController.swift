//
//  DHVideoPlayDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 10/9/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHVideoPlayDataController: NSObject {

    func requestVideoDetailWithCallback( ykvid: String, callback: @autoclosure @escaping () -> Swift.Void) {
        let url = URL(string: kGetVideoDetailInfoUrl)
        let parameters: NSDictionary = ["client_id": kYoukuClientId, "video_id": ykvid]
        DHNetworkRequestManager.sharedInstance.requestWithUrl(type: .GET, urlHeader: url, parameters: parameters) { (Data, URLResponse, Error) in
            if Error == nil {
                do {
                    let result = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    print(result)
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
