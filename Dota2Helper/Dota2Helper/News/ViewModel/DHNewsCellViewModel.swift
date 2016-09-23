//
//  DHNewsCellViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/19/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import Kingfisher

class DHNewsCellViewModel: NSObject {

    var newsModel: DHNewsModel?
    var backgroundImageView: UIImageView?
    var nid: String?
    var date: String?
    var background: String?
    var title: String?
    var newsDescription: String?
    var time: String?
    
    init(newsModel: DHNewsModel?) {
        super.init()
        
        self.newsModel = newsModel
        let url = URL(string: (newsModel?.background)!)
        backgroundImageView?.kf_setImage(with: url)
        nid = newsModel?.nid
        date = newsModel?.date
        background = newsModel?.background
        title = newsModel?.title
        newsDescription = newsModel?.newsDescription
        time = newsModel?.time
    }
    
    func viewModel(newsModel: DHNewsModel?) -> DHNewsCellViewModel {
        return DHNewsCellViewModel.init(newsModel: newsModel)
    }
    
}
