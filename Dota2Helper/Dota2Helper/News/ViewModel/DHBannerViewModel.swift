//
//  DHBannerViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/23/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHBannerViewModel: NSObject {

    var nid: String?
    var date: String?
    var background: String?
    
    init(banner: DHNewsModel) {
        self.nid = banner.nid
        self.date = banner.date
        self.background = banner.background
    }
    
    func viewModel(banner: DHNewsModel) -> DHBannerViewModel {
        return DHBannerViewModel.init(banner: banner)
    }
    
}
