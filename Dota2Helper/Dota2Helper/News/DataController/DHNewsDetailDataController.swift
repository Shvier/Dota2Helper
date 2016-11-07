//
//  DHNewsDetailDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 07/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHNewsDetailDataController: NSObject {

    static let sharedInstance = DHNewsDetailDataController()
    
    var request: URLRequest?
    
    func getNewsDetail(date: String, nid: String, success: @escaping (_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        request = URLRequest(url: URL(string: kGetNewsDetailUrl + date + "/" + nid)!)
        DHGetNewsDetailRequest.requestNewsDetailData(date: date, nid: nid, success: success, failure: failure)
    }
    
}
