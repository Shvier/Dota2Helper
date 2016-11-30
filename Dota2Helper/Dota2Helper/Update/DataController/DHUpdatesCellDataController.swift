//
//  DHUpdatesCellDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 12/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHUpdatesCellDataController: NSObject {

    static let sharedInstance = DHUpdatesCellDataController()
    
    func getUpdates(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetUpdatesRequest.requestUpdatesData(success: success, failure: failure)
    }
    
    func loadMoreUpates(nid: String, success: @escaping (_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHLoadMoreUpdatesRequest.requestMoreUpdatesData(nid: nid, success: success, failure: failure)
    }
    
    func getUpdatesDetail(date: String, nid: String, success: @escaping (_ urlString: String) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetNewsDetailRequest.requestNewsDetailData(date: date, nid: nid, success: success, failure: failure)
    }
        
}
