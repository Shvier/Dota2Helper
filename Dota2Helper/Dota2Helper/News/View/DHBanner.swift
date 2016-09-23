//
//  DHBanner.swift
//  Dota2Helper
//
//  Created by Shvier on 9/23/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import Kingfisher

class DHBanner: UIView {

    var nid: String?
    var date: String?
    var backgroundImage: UIImageView?
    var newsModel: DHNewsModel?
    var callback: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundImage = UIImageView(frame: frame)
        self.addSubview(backgroundImage!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func bindDataWithViewModel(viewModel: DHBannerViewModel) {
        self.newsModel = viewModel.newsModel
        self.nid = viewModel.nid
        self.date = viewModel.date
        let url: URL = URL(string: viewModel.background!)!
        self.backgroundImage?.kf_setImage(with: url)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DHBanner.loadRequest))
        self.addGestureRecognizer(tap)
    }
    
    func loadRequest() {
        callback!()
    }

    func setTapCallback(callback: (() -> Void)) {
        callback()
    }
}
