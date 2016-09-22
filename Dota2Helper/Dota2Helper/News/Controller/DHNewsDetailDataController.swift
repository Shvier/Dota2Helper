//
//  DHNewsDetailDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/22/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHNewsDetailDataController: NSObject {

    func requestNewsDetailDataUrlWithNewsCell(newsCell: DHNewsTableViewCell) -> URLRequest {
        let parameter: NSDictionary = NSDictionary(objects: [newsCell.viewModel?.date!, newsCell.viewModel?.nid!], forKeys: ["date" as NSCopying, "nid" as NSCopying])
        let url: URL = URL(string: kGetNewsDetailUrl)!
        let request: URLRequest = DHNetworkRequestManager().convertUrlToRequest(urlHeader: url, parameters: parameter)
        return request
    }
    
}
