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
    
    var dataController: DHNewsCellDataController = DHNewsCellDataController.sharedInstance
    
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
    
    func bindData() {
        dataController.getNews(success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let bannerArray = result["banner"]
                let newsArray = result["news"]
                for bannerDict in bannerArray as! [NSDictionary] {
                    let banner: DHNewsModel = DHNewsModel()
                    banner.setValuesForKeys(bannerDict as! [String : Any])
                }
                for newsDict in newsArray as! [NSDictionary] {
                    let news: DHNewsModel = DHNewsModel()
                    news.setValuesForKeys(newsDict as! [String : Any])
                }
                DHLog(result)
            } catch {
                
            }
        }, failure: {} ())
    }
    
}
