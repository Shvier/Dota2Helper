//
//  DHTutorialDetailDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHTutorialDetailDataController: NSObject {

    func requestTutorialDetailDataUrlWithTutorialModel(strategyModel: DHStrategyModel) -> URLRequest {
        let parameter: NSArray = NSArray(array: [(strategyModel.date)!, (strategyModel.nid)!])
        let url: URL = URL(string: kGetNewsDetailUrl)!
        let request: URLRequest = DHNetworkRequestManager().convertUrlToDEFAULTRequset(urlHeader: url, parameters: parameter)
        return request
    }
    
}
