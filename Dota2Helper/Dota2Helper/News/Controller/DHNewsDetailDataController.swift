//
//  DHNewsDetailDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/22/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHNewsDetailDataController: NSObject {

    func requestNewsDetailDataUrlWithNewsModel(newsModel: DHNewsModel) -> URLRequest {
        let parameter: NSArray = NSArray(array: [newsModel.date, newsModel.nid])
        let url: URL = URL(string: kGetNewsDetailUrl)!
        let request: URLRequest = DHNetworkRequestManager().convertUrlToGETRequset(urlHeader: url, parameters: parameter)
        return request
    }
    
}
