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

    var request: URLRequest?
    
    init(request: URLRequest) {
        self.request = request
    }
    
}
