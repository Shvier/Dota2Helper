//
//  DHTutorialDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/29/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHTutorialDataController: NSObject {

    lazy var tutorialDataSource: NSMutableArray? = {[]} ()
    
    func requestTutorialDataWithCallback( callback: @autoclosure @escaping () -> Swift.Void) {
        let url = URL(string: kRefreshStrategiesUrl)
        let parameters: NSArray = ["all"]
        DHNetworkRequestManager.sharedInstance.requestWithUrl(type: .GET, urlHeader: url, parameters: parameters) { (Data, URLResponse, Error) in
            if Error == nil {
                do {
                    let result = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    let tutorialArray = result["strategies"]
                    for tutorialDict in tutorialArray as! [NSDictionary] {
                        let tutorial: DHTutorialModel = DHTutorialModel()
                        tutorial.setValuesForKeys(tutorialDict as! [String : Any])
                        self.tutorialDataSource?.add(tutorial)
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
    
    func requestMoreTutorial( callback: @autoclosure @escaping () -> Void) {
        let url = URL(string: kLoadMoreStrategiesUrl)
        let lastModel = tutorialDataSource![(tutorialDataSource?.count)! - 1] as! DHTutorialModel
        let parameter: [String] = ["all", lastModel.nid!]
        DHNetworkRequestManager.sharedInstance.requestWithUrl(type: .GET, urlHeader: url, parameters: parameter) { (Data, URLResponse, Error) in
            if Error == nil {
                do {
                    let result = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    let tutorialArray = result["strategies"]
                    for tutorialDict in tutorialArray as! [NSDictionary] {
                        let tutorial: DHTutorialModel = DHTutorialModel()
                        tutorial.setValuesForKeys(tutorialDict as! [String : Any])
                        self.tutorialDataSource?.add(tutorial)
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
