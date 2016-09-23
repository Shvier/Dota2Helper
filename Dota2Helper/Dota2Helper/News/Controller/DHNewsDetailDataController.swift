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
        let parameter: NSArray = NSArray(array: [newsCell.viewModel?.date, newsCell.viewModel?.nid])
        let url: URL = URL(string: kGetNewsDetailUrl)!
        let request: URLRequest = DHNetworkRequestManager().convertUrlToGETRequset(urlHeader: url, parameters: parameter)
        return request
    }
    
}
