//
//  DHJournalCellDetailViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 26/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHUpdatesDetailViewModel: NSObject {

    lazy var dataController: DHUpdatesDetailDataController = {
        return DHUpdatesDetailDataController()
    }()
    
    func getDetailUpdates(model: DHUpdateModel, _ success: @escaping (_ urlString: String) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getUpdatesDetail(date: model.date!, nid: model.nid!, success: { (urlString) in
            success(urlString)
        }, failure: failure)
    }
}
