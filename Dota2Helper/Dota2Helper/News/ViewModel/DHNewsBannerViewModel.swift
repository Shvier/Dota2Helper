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
    
    init(_ banners: [DHNewsModel]) {
        super.init()
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: kBannerWidth, height: kBannerHeight))
        scrollView?.contentSize = CGSize(width: kBannerWidth*CGFloat(banners.count + 1), height: kBannerHeight)
        scrollView?.isPagingEnabled = true
        scrollView?.showsHorizontalScrollIndicator = false
        let firstImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kBannerWidth, height: kBannerHeight))
        let url = URL(string: banners[0].background!)
        firstImageView.kf_setImage(with: url)
        scrollView?.addSubview(firstImageView)
        let index = 1;
        for banner in banners {
            let imageView = UIImageView(frame: CGRect(x: kBannerWidth*CGFloat(index), y: 0, width: kBannerWidth, height: kBannerHeight))
            let url = URL(string: banner.background!)
            imageView.kf_setImage(with: url)
            scrollView?.addSubview(imageView)
        }
    }
    
    func viewModel(_ banners: [DHNewsModel]) -> DHNewsBannerViewModel {
        return DHNewsBannerViewModel.init(banners)
    }
    
}
