//
//  DHNewsCellViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/19/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

let kBannerWidth: CGFloat = UIScreen.main.bounds.size.width
let kBannerHeight: CGFloat = kBannerWidth * 9.0 / 16.0

class DHNewsCellViewModel: NSObject {
    
    let dataController: DHNewsCellDataController = DHNewsCellDataController.sharedInstance
    lazy var newsDataSource: [DHNewsModel]? = {[]} ()
    lazy var bannerDataSource: [DHNewsModel]? = {[]} ()
    lazy var imageUrlStrings: [String]? = {[]} ()
    lazy var titleStrings: [String]? = {[]} ()
    
    func refreshNews(_ callback: @autoclosure @escaping () -> Void) {
        dataController.getNews(success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let bannerArray = result["banner"]
                let newsArray = result["news"]
                self.imageUrlStrings?.removeAll()
                self.titleStrings?.removeAll()
                self.bannerDataSource?.removeAll()
                self.newsDataSource?.removeAll()
                for bannerDict in bannerArray as! [NSDictionary] {
                    let banner: DHNewsModel = DHNewsModel()
                    banner.setValuesForKeys(bannerDict as! [String : Any])
                    self.bannerDataSource?.append(banner)
                    self.imageUrlStrings?.append(banner.background!)
                    self.titleStrings?.append(banner.title!)
                }
                for newsDict in newsArray as! [NSDictionary] {
                    let news: DHNewsModel = DHNewsModel()
                    news.setValuesForKeys(newsDict as! [String : Any])
                    self.newsDataSource?.append(news)
                }
                callback()
            } catch {
                
            }
        }, failure: {} ())
    }
    
    func loadMoreNews(_ callback: @autoclosure @escaping () -> Void) {
        dataController.loadMoreNews(nid: (newsDataSource?.last?.nid)!, success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let newsArray = result["news"]
                for newsDict in newsArray as! [NSDictionary] {
                    let news: DHNewsModel = DHNewsModel()
                    news.setValuesForKeys(newsDict as! [String : Any])
                    self.newsDataSource?.append(news)
                }
                callback()
            } catch {

            }
        }, failure: {} ())
    }
    
}
