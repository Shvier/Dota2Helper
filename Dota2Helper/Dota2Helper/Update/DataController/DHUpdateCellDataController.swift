//
//  DHUpdateCellDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 12/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHUpdateCellDataController: NSObject {
    
    func getUpdate(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetUpdateRequest.requestUpdateData(success: success, failure: failure)
    }
    
    func loadMoreUpates(nid: String, success: @escaping (_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHLoadMoreUpdateRequest.requestMoreUpdateData(nid: nid, success: success, failure: failure)
    }
    
    func getUpdateDetail(date: String, nid: String, success: @escaping (_ urlString: String) -> Void, failure: @autoclosure @escaping () -> Void) {
        DHGetNewsDetailRequest.requestNewsDetailData(date: date, nid: nid, success: success, failure: failure)
    }
        
}
