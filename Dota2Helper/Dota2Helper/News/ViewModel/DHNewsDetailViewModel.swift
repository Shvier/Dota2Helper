//
//  DHNewsDetailViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/22/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHNewsDetailViewModel: NSObject {

    lazy var dataController: DHNewsDetailDataController = {
        return DHNewsDetailDataController()
    }()
    
    func getDetailNews(model: DHNewsModel, _ success: @escaping (_ urlString: String) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getNewsDetail(date: model.date!, nid: model.nid!, success: { (urlString) in
            success(urlString)
        }, failure: failure)
    }

}
