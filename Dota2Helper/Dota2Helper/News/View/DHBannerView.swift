//
//  DHBannerView.swift
//  Dota2Helper
//
//  Created by Shvier on 9/20/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import Kingfisher

class DHBannerView: UIView, UIScrollViewDelegate {
    
    var layout: CGRect?
    var scrollView: UIScrollView?
    var bannerCount: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let offset: CGPoint = scrollView.contentOffset
        if offset.x > kBannerWidth*CGFloat(bannerCount!-1) {
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        }
        if offset.x < kBannerWidth {
            scrollView.setContentOffset(CGPoint(x: kBannerWidth*CGFloat(bannerCount!), y: 0), animated: false)
        }
    }
    
    func bindDataWithViewModel(_ viewModel: DHNewsBannerViewModel) {
        bannerCount = viewModel.bannerCount
        scrollView = viewModel.scrollView
        scrollView?.delegate = self
        self.addSubview(scrollView!)
    }
    
}
