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
    
    lazy var dataController: DHNewsCellDataController = {
        return DHNewsCellDataController()
    }()
    
    lazy var bannerDataSource: [DHNewsModel] = {
        return Array<DHNewsModel>()
    }()
    
    lazy var newsDataSource: [DHNewsModel] = {
        return Array<DHNewsModel>()
    }()
    
    lazy var imageUrlDataSource: [String] = {
        return Array<String>()
    }()

    lazy var titleUrlDataSource: [String] = {
        return Array<String>()
    }()
    
    func refreshNews(_ success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getNews(success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let bannerArray = result["banner"]
                let newsArray = result["news"]
                    
                var bannerDataSource: [DHNewsModel] = Array<DHNewsModel>()
                var newsDataSource: [DHNewsModel] = Array<DHNewsModel>()
                var imageUrlDataSource: [String] = Array<String>()
                var titleUrlDataSource: [String] = Array<String>()
                    
                for bannerDict in bannerArray as! [NSDictionary] {
                    let banner: DHNewsModel = DHNewsModel(dictionary: bannerDict)
                    bannerDataSource.append(banner)
                    imageUrlDataSource.append(banner.background!)
                    titleUrlDataSource.append(banner.title!)
                }
                for newsDict in newsArray as! [NSDictionary] {
                    let news: DHNewsModel = DHNewsModel(dictionary: newsDict)
                    newsDataSource.append(news)
                }
                
                self.bannerDataSource = bannerDataSource
                self.newsDataSource = newsDataSource
                self.imageUrlDataSource = imageUrlDataSource
                self.titleUrlDataSource = titleUrlDataSource
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreNews(nid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreNews(nid: nid, success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let newsArray = result["news"]
                    
                var newsDataSource: [DHNewsModel] = Array<DHNewsModel>()
                    
                for newsDict in newsArray as! [NSDictionary] {
                    let news: DHNewsModel = DHNewsModel(dictionary: newsDict)
                    news.setValuesForKeys(newsDict as! [String : Any])
                    newsDataSource.append(news)
                }
                self.newsDataSource.append(contentsOf: newsDataSource)
                success()
            } catch {

            }
        }, failure: failure)
    }
    
}
