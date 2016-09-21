//
//  DHBannerView.swift
//  Dota2Helper
//
//  Created by Shvier on 9/20/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import Kingfisher

class DHBannerView: UIView {
    
    var layout: CGRect?
    var scrollView: UIScrollView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func bindDataWithViewModel(_ viewModel: DHNewsBannerViewModel) {
        scrollView = viewModel.scrollView
        self.addSubview(scrollView!)
    }
    
}
