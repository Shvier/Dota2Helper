//
//  DHTutorialDetailDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHTutorialDetailDataController: NSObject {

    func requestTutorialDetailDataUrlWithTutorialModel(tutorialModel: DHTutorialModel) -> URLRequest {
        let parameter: NSArray = NSArray(array: [(tutorialModel.date)!, (tutorialModel.nid)!])
        let url: URL = URL(string: kGetNewsDetailUrl)!
        let request: URLRequest = DHNetworkRequestManager().convertUrlToDEFAULTRequset(urlHeader: url, parameters: parameter)
        return request
    }
    
}
