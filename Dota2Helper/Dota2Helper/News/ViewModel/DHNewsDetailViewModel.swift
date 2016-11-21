//
//  DHNewsDetailViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/22/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHNewsDetailViewModel: NSObject {

    let dataController: DHNewsDetailDataController = DHNewsDetailDataController.sharedInstance
    var htmlContent: String?
    var request: URLRequest?
    
    func getDetailNews(model: DHNewsModel, _ callback: @autoclosure @escaping () -> Void) {
        dataController.getNewsDetail(date: model.date!, nid: model.nid!, success: { [unowned self] (response) in
            self.request = URLRequest(url: URL(string: response)!)
            callback()
        }, failure: {} ())
    }

}
