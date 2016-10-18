//
//  DHBaseDetailDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 10/18/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHBaseDetailDataController: NSObject {

    func requestDetailDataUrlWithNewsModel(newsModel: DHNewsModel) -> URLRequest {
        let parameter: NSArray = NSArray(array: [newsModel.date, newsModel.nid])
        let url: URL = URL(string: kGetNewsDetailUrl)!
        let request: URLRequest = DHNetworkRequestManager().convertUrlToDEFAULTRequset(urlHeader: url, parameters: parameter)
        return request
    }
    
}
