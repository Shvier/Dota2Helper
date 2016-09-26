//
//  DHJournalDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/25/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHJournalDataController: NSObject {

    lazy var newsDataSource: NSMutableArray? = {[]} ()
    
    func requestNewsDataWithCallback(callback: @autoclosure @escaping () -> Void) {
        let url = URL(string: kRefreshUpdatesUrl)
        DHNetworkRequestManager.sharedInstance.requestWithUrl(type: .GET, urlHeader: url, parameters: nil) { (Data, URLResponse, Error) in
            if Error == nil {
                do {
                    let result = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    let newsArray = result["news"]
                    for newsDict in newsArray as! [NSDictionary] {
                        let updates: DHJournalModel = DHJournalModel()
                        updates.setValuesForKeys(newsDict as! [String : Any])
                        self.newsDataSource?.add(updates)
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
