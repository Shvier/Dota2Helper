//
//  DHJournalDetailDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/26/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHJournalDetailDataController: NSObject {

    func requestJournalDetailDataWithJournalModel(journalModel: DHJournalModel) -> URLRequest {
        let parameter: NSArray = NSArray(array: [(journalModel.date)!, (journalModel.nid)!])
        let url: URL = URL(string: kGetNewsDetailUrl)!
        let request: URLRequest = DHNetworkRequestManager().convertUrlToDEFAULTRequset(urlHeader: url, parameters: parameter)
        return request
    }
    
}
