//
//  DHNewsDetailViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/22/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

let kNewsDetailViewWidth: CGFloat = UIScreen.main.bounds.size.width
let kNewsDetailViewHeight: CGFloat = UIScreen.main.bounds.size.height - CGFloat(kNavigationHeight)

class DHNewsDetailViewModel: NSObject {

    var request: URLRequest?
    
    init(request: URLRequest) {
        self.request = request
    }
    
    func viewModelWithURLRequest(request: URLRequest) -> DHNewsDetailViewModel {
        return DHNewsDetailViewModel.init(request: request)
    }
}
