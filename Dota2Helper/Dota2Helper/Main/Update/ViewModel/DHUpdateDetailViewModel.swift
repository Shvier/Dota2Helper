//
//  DHUpdateCellDetailViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 26/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHUpdateDetailViewModel: NSObject {

    lazy var dataController: DHUpdateDetailDataController = {
        return DHUpdateDetailDataController()
    }()
    
    func getDetailUpdate(model: DHNewsModel, _ success: @escaping (_ urlString: String) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getUpdateDetail(date: model.date!, nid: model.nid!, success: { (urlString) in
            success(urlString)
        }, failure: failure)
    }
}
