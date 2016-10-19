//
//  DHHeaderView.swift
//  Dota2Helper
//
//  Created by Shvier on 9/20/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import Kingfisher

class DHHeaderView: UIView, UIScrollViewDelegate {
    
    var layout: CGRect?
    var scrollView: UIScrollView?
    var bannerCount: Int?
    var banners: NSMutableArray?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func bindDataWithViewModel(viewModel: DHNewsBannerViewModel) {
        bannerCount = viewModel.bannerCount
        scrollView = viewModel.scrollView
        scrollView?.delegate = self
        self.addSubview(scrollView!)
    }
    
}
