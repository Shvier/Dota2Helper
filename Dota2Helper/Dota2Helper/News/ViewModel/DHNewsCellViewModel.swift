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
                guard let result = try? JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                guard let bannerArray = result?["banner"] as? Array<NSDictionary> else {
                    throw DHUniformJSONError.DHJSONErrorKeyNotFound
                }
                guard let newsArray = result?["news"] as? Array<NSDictionary> else {
                    throw DHUniformJSONError.DHJSONErrorKeyNotFound
                }
                    
                var bannerDataSource: [DHNewsModel] = Array<DHNewsModel>()
                var newsDataSource: [DHNewsModel] = Array<DHNewsModel>()
                var imageUrlDataSource: [String] = Array<String>()
                var titleUrlDataSource: [String] = Array<String>()
                    
                for bannerDict in bannerArray {
                    let banner: DHNewsModel = DHNewsModel(dictionary: bannerDict)
                    bannerDataSource.append(banner)
                    imageUrlDataSource.append(banner.background!)
                    titleUrlDataSource.append(banner.title!)
                }
                for newsDict in newsArray {
                    let news: DHNewsModel = DHNewsModel(dictionary: newsDict)
                    newsDataSource.append(news)
                }
                
                self.bannerDataSource = bannerDataSource
                self.newsDataSource = newsDataSource
                self.imageUrlDataSource = imageUrlDataSource
                self.titleUrlDataSource = titleUrlDataSource
                success()
            } catch DHUniformJSONError.DHJSONErrorParseFailed {
                DHLog("Refresh News failed")
            } catch DHUniformJSONError.DHJSONErrorKeyNotFound {
                DHLog("Key not found in Dictionary")
            } catch let error {
                DHLog("Other Error: \(error)")
            }
        }, failure: failure)
    }
    
    func loadMoreNews(nid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreNews(nid: nid, success: { (response) in
            do {
                guard let result = try? JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                guard let newsArray = result?["news"] else {
                    throw DHUniformJSONError.DHJSONErrorKeyNotFound
                }
                    
                var newsDataSource: [DHNewsModel] = Array<DHNewsModel>()
                    
                for newsDict in newsArray as! [NSDictionary] {
                    let news: DHNewsModel = DHNewsModel(dictionary: newsDict)
                    news.setValuesForKeys(newsDict as! [String : Any])
                    newsDataSource.append(news)
                }
                self.newsDataSource.append(contentsOf: newsDataSource)
                success()
            } catch DHUniformJSONError.DHJSONErrorParseFailed {
                DHLog("Load More News failed")
            } catch DHUniformJSONError.DHJSONErrorKeyNotFound {
                DHLog("Key not found in Dictionary")
            } catch let error {
                DHLog("Other Error: \(error)")
            }
        }, failure: failure)
    }
    
}
