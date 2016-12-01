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
    
    func refreshNews(_ success: @escaping (_ newsDict: NSDictionary) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getNews(success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let bannerArray = result["banner"]
                let newsArray = result["news"]
                    
                var bannerDataSource: [DHNewsModel] = Array<DHNewsModel>()
                var newsDataSource: [DHNewsModel] = Array<DHNewsModel>()
                var imageUrlStrings: [String] = Array<String>()
                var titleUrlStrings: [String] = Array<String>()
                    
                for bannerDict in bannerArray as! [NSDictionary] {
                    let banner: DHNewsModel = DHNewsModel(dictionary: bannerDict)
                    bannerDataSource.append(banner)
                    imageUrlStrings.append(banner.background!)
                    titleUrlStrings.append(banner.title!)
                }
                for newsDict in newsArray as! [NSDictionary] {
                    let news: DHNewsModel = DHNewsModel(dictionary: newsDict)
                    newsDataSource.append(news)
                }
                success(["banner": bannerDataSource, "news": newsDataSource, "imageUrl": imageUrlStrings, "titleUrl": titleUrlStrings])
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreNews(nid: String, success: @escaping (_ newsArray: [DHNewsModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
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
                success(newsDataSource)
            } catch {

            }
        }, failure: failure)
    }
    
}
