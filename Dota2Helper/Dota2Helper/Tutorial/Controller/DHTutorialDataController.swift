//
//  DHTutorialDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/29/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHTutorialDataController: NSObject {

    func requestTutorialDataWithCallback( callback: @autoclosure @escaping () -> Swift.Void) {
        let url = URL(string: kRefreshStrategiesUrl)
        DHNetworkRequestManager.sharedInstance.requestWithUrl(type: .GET, urlHeader: url, parameters: nil) { (Data, URLResponse, Error) in
            if Error == nil {
                do {
                    let result = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    
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
