//
//  DHStrategyDetailViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 16/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

let kStrategyDetailViewWidth: CGFloat = UIScreen.main.bounds.size.width
let kStrategyDetailViewHeight: CGFloat = UIScreen.main.bounds.size.height - CGFloat(kNavigationHeight)

class DHStrategyDetailViewModel: NSObject {

    lazy var dataController: DHStrategyDetailDataController = {
        return DHStrategyDetailDataController()
    }()
    
    func getDetailStrategy(model: DHStrategyModel, _ success: @escaping (_ urlString: String) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getStrategyDetail(date: model.date!, nid: model.nid!, success: { (urlString) in
            success(urlString)
        }, failure: failure)
    }
    
}
