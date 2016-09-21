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
let kBannerHeight: CGFloat = 200.0

class DHNewsBannerViewModel: NSObject {

    var scrollView: UIScrollView?
    var bannerCount: Int?
    
    init(_ banners: [DHNewsModel]) {
        super.init()
        
        bannerCount = banners.count
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: kBannerWidth, height: kBannerHeight))
        scrollView?.contentSize = CGSize(width: kBannerWidth*CGFloat(banners.count + 1), height: kBannerHeight)
        scrollView?.isPagingEnabled = true
        scrollView?.showsHorizontalScrollIndicator = false
        
        var index = 0;
        for banner in banners {
            let imageView = UIImageView(frame: CGRect(x: kBannerWidth*CGFloat(index), y: 0, width: kBannerWidth, height: kBannerHeight))
            let url = URL(string: banner.background!)
            imageView.kf_setImage(with: url)
            scrollView?.addSubview(imageView)
            index += 1
        }
        let lastImageView = UIImageView(frame: CGRect(x: kBannerWidth*CGFloat(index), y: 0, width: kBannerWidth, height: kBannerHeight))
        let url = URL(string: banners[0].background!)
        lastImageView.kf_setImage(with: url)
        scrollView?.addSubview(lastImageView)
    }
    
    func viewModel(_ banners: [DHNewsModel]) -> DHNewsBannerViewModel {
        return DHNewsBannerViewModel.init(banners)
    }
    
}
