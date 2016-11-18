//
//  DHJournalCellDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 12/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHJournalCellDataController: NSObject {

    static let sharedInstance = DHJournalCellDataController()
    
    func getUpdates(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetUpdatesRequest.requestUpdatesData(success: success, failure: failure)
    }
    
    func loadMoreUpates(nid: String, success: @escaping (_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHLoadMoreUpdatesRequest.requestMoreUpdatesData(nid: nid, success: success, failure: failure)
    }
        
}
