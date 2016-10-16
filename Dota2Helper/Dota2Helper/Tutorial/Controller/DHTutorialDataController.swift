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
    
    func requestTutorialAllWithCallback(callback: @autoclosure @escaping () -> Void) {
        requestTutorialDataWithCallback(callback: callback, category: "all")
    }
    
    func requestTutorialNewerWithCallback(callback: @autoclosure @escaping () -> Void) {
        requestTutorialDataWithCallback(callback: callback, category: "newer")
    }
    
    func requestTutorialStepWithCallback(callback: @autoclosure @escaping () -> Void) {
        requestTutorialDataWithCallback(callback: callback, category: "step")
    }
    
    func requestTutorialSkillWithCallback(callback: @autoclosure @escaping () -> Void) {
        requestTutorialDataWithCallback(callback: callback, category: "skill")
    }
    
    func requestTutorialDataWithCallback(callback: @autoclosure @escaping () -> Void, category: String) {
        let url = URL(string: kRefreshStrategiesUrl)
        let parameters: NSArray = [category]
        DHNetworkRequestManager.sharedInstance.requestWithUrl(type: .DEFAULT, urlHeader: url, parameters: parameters) { (Data, URLResponse, Error) in
            if Error == nil {
                do {
                    let result = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    let tutorialArray = result["strategies"]
                    self.tutorialDataSource?.removeAllObjects()
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
        DHNetworkRequestManager.sharedInstance.requestWithUrl(type: .DEFAULT, urlHeader: url, parameters: parameter) { (Data, URLResponse, Error) in
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
