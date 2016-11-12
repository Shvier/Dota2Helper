//
//  DHNewsCellDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 05/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHNewsCellDataController: NSObject {

    static let sharedInstance = DHNewsCellDataController()
    
    func getNews(success: @escaping (_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetNewsRequest.requestNewsData(success: success, failure: failure)
    }
    
    func loadMoreNews(nid: String, success: @escaping (_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHLoadMoreNewsRequest.requestMoreNewsData(nid: nid, success: success, failure: failure)
    }
    
}
