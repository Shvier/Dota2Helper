//
//  DHVideoCellViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 10/5/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHVideoCellViewModel: NSObject {

    var ykvid: String?
    var videolength: String?
    var vid: String?
    var title: String?
    var publishin: String?
    var background: String?
    var date: String?
    
    init(videoModel: DHVideoModel?) {
        super.init()
        
        self.ykvid = videoModel?.ykvid
        self.videolength = videoModel?.videolength
        self.vid = videoModel?.vid
        self.title = videoModel?.title
        self.publishin = videoModel?.publishin
        self.background = videoModel?.background
        self.date = videoModel?.date
    }
    
    let dataController: DHVideoCellDataController = DHVideoCellDataController.sharedInstance
    
    func getAllVideos(success: @escaping(_ videosDataSource: [DHVideoModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getAllVideos(success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videosDicts = result["videos"]
                
                var videosDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videosDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videosDataSource.append(video)
                }
                success(videosDataSource)
            } catch {
                
            }
        }, failure: {} ())
    }
    
    func getJieshuoVideos(success: @escaping(_ videosDataSource: [DHVideoModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getJieshuoVideos(success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videosDicts = result["videos"]
                
                var videosDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videosDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videosDataSource.append(video)
                }
                success(videosDataSource)
            } catch {
                
            }
        }, failure: {} ())
    }
    
    func getBisaiVideos(success: @escaping(_ videosDataSource: [DHVideoModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getBisaiVideos(success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videosDicts = result["videos"]
                
                var videosDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videosDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videosDataSource.append(video)
                }
                success(videosDataSource)
            } catch {
                
            }
        }, failure: {} ())
    }
    
    func getCelebrityVideos(success: @escaping(_ videosDataSource: [DHVideoModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getCelebrityVideos(success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videosDicts = result["videos"]
                
                var videosDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videosDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videosDataSource.append(video)
                }
                success(videosDataSource)
            } catch {
                
            }
        }, failure: {} ())
    }
    
    func getQuweiVideos(success: @escaping(_ videosDataSource: [DHVideoModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getQuweiVideos(success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videosDicts = result["videos"]
                
                var videosDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videosDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videosDataSource.append(video)
                }
                success(videosDataSource)
            } catch {
                
            }
        }, failure: {} ())
    }
    
    func getBeginnerVideos(success: @escaping(_ videosDataSource: [DHVideoModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getBeginnerVideos(success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videosDicts = result["videos"]
                
                var videosDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videosDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videosDataSource.append(video)
                }
                success(videosDataSource)
            } catch {
                
            }
        }, failure: {} ())
    }
    
    func getAdvancedVideos(success: @escaping(_ videosDataSource: [DHVideoModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getAdvancedVideos(success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videosDicts = result["videos"]
                
                var videosDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videosDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videosDataSource.append(video)
                }
                success(videosDataSource)
            } catch {
                
            }
        }, failure: {} ())
    }
    
    func loadMoreAllVideos(vid: String, success: @escaping(_ videosDataSource: [DHVideoModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreAllVideos(vid: vid, success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videosDicts = result["videos"]
                
                var videosDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videosDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videosDataSource.append(video)
                }
                success(videosDataSource)
            } catch {
                
            }
        }, failure: {} ())
    }
    
    func loadMoreJieshuoVideos(vid: String, success: @escaping(_ videosDataSource: [DHVideoModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreJieshuoVideos(vid: vid, success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videosDicts = result["videos"]
                
                var videosDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videosDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videosDataSource.append(video)
                }
                success(videosDataSource)
            } catch {
                
            }
        }, failure: {} ())
    }
    
    func loadMoreBisaiVideos(vid: String, success: @escaping(_ videosDataSource: [DHVideoModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreBisaiVideos(vid: vid, success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videosDicts = result["videos"]
                
                var videosDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videosDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videosDataSource.append(video)
                }
                success(videosDataSource)
            } catch {
                
            }
        }, failure: {} ())
    }
    
    func loadMoreCelebrityVideos(vid: String, success: @escaping(_ repsonse: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreCelebrityVideos(vid: vid, success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videosDicts = result["videos"]
                
                var videosDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videosDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videosDataSource.append(video)
                }
                success(videosDataSource)
            } catch {
                
            }
        }, failure: {} ())
    }
    
    func loadMoreQuweiVideos(vid: String, success: @escaping(_ videosDataSource: [DHVideoModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreQuweiVideos(vid: vid, success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videosDicts = result["videos"]
                
                var videosDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videosDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videosDataSource.append(video)
                }
                success(videosDataSource)
            } catch {
                
            }
        }, failure: {} ())
    }
    
    func loadMoreBeginnerVideos(vid: String, success: @escaping(_ videosDataSource: [DHVideoModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreBeginnerVideos(vid: vid, success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videosDicts = result["videos"]
                
                var videosDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videosDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videosDataSource.append(video)
                }
                success(videosDataSource)
            } catch {
                
            }
        }, failure: {} ())
    }
    
    func loadMoreAdvancedVideos(vid: String, success: @escaping(_ videosDataSource: [DHVideoModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreAdvancedVideos(vid: vid, success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videosDicts = result["videos"]
                
                var videosDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videosDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videosDataSource.append(video)
                }
                success(videosDataSource)
            } catch {
                
            }
        }, failure: {} ())
    }
    
    func getRelatedVideos(vid: String, success: @escaping(_ videosDataSource: [DHVideoModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getRelatedVideos(vid: vid, success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videosDicts = result["videos"]
                
                var videosDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videosDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videosDataSource.append(video)
                }
                success(videosDataSource)
            } catch {
                
            }
        }, failure: {} ())
    }
    
}
