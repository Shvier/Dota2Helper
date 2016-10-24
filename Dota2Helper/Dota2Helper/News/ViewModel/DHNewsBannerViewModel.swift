//
//  DHNewsBannerViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/20/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import Kingfisher

let kBannerWidth: CGFloat = UIScreen.main.bounds.size.width
let kBannerHeight: CGFloat = kBannerWidth * 9.0 / 16.0

class DHNewsBannerViewModel: NSObject {

    var scrollView: UIScrollView?
    var bannerCount: Int?
    lazy var banners: [DHNewsModel]? = {[]} ()
    lazy var imageUrlStrings: [String]? = {[]} ()
    lazy var titleStrings: [String]? = {[]} ()
    
    init(banners: [DHNewsModel]) {
        super.init()

        self.banners = banners
        for banner in banners {
            imageUrlStrings?.append(banner.background!)
            titleStrings?.append(banner.title!)
        }
    }
    
}
