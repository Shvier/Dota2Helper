//
//  DHVideoCellViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 10/5/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHVideoCellViewModel: NSObject {
    
    lazy var dataController: DHVideoCellDataController = {
        return DHVideoCellDataController()
    }()
    
    lazy var videoDataSource: [DHVideoModel] = {
        return Array<DHVideoModel>()
    }()
    
    func getAllVideos(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getAllVideos(success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videoDicts = result["videos"]
                
                var videoDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videoDict in videoDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videoDict)
                    videoDataSource.append(video)
                }
                self.videoDataSource = videoDataSource
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func getJieshuoVideos(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getJieshuoVideos(success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videoDicts = result["videos"]
                
                var videoDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videoDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videoDataSource.append(video)
                }
                self.videoDataSource = videoDataSource
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func getBisaiVideos(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getBisaiVideos(success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videoDicts = result["videos"]
                
                var videoDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videoDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videoDataSource.append(video)
                }
                self.videoDataSource = videoDataSource
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func getCelebrityVideos(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getCelebrityVideos(success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videoDicts = result["videos"]
                
                var videoDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videoDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videoDataSource.append(video)
                }
                self.videoDataSource = videoDataSource
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func getQuweiVideos(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getQuweiVideos(success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videoDicts = result["videos"]
                
                var videoDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videoDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videoDataSource.append(video)
                }
                self.videoDataSource = videoDataSource
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func getBeginnerVideos(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getBeginnerVideos(success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videoDicts = result["videos"]
                
                var videoDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videoDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videoDataSource.append(video)
                }
                self.videoDataSource = videoDataSource
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func getAdvancedVideos(success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getAdvancedVideos(success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videoDicts = result["videos"]
                
                var videoDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videoDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videoDataSource.append(video)
                }
                self.videoDataSource = videoDataSource
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreAllVideos(vid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreAllVideos(vid: vid, success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videoDicts = result["videos"]
                
                var videoDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videoDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videoDataSource.append(video)
                }
                self.videoDataSource.append(contentsOf: videoDataSource)
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreJieshuoVideos(vid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreJieshuoVideos(vid: vid, success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videoDicts = result["videos"]
                
                var videoDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videoDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videoDataSource.append(video)
                }
                self.videoDataSource.append(contentsOf: videoDataSource)
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreBisaiVideos(vid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreBisaiVideos(vid: vid, success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videoDicts = result["videos"]
                
                var videoDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videoDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videoDataSource.append(video)
                }
                self.videoDataSource.append(contentsOf: videoDataSource)
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreCelebrityVideos(vid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreCelebrityVideos(vid: vid, success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videoDicts = result["videos"]
                
                var videoDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videoDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videoDataSource.append(video)
                }
                self.videoDataSource.append(contentsOf: videoDataSource)
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreQuweiVideos(vid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreQuweiVideos(vid: vid, success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videoDicts = result["videos"]
                
                var videoDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videoDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videoDataSource.append(video)
                }
                self.videoDataSource.append(contentsOf: videoDataSource)
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreBeginnerVideos(vid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreBeginnerVideos(vid: vid, success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videoDicts = result["videos"]
                
                var videoDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videoDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videoDataSource.append(video)
                }
                self.videoDataSource.append(contentsOf: videoDataSource)
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreAdvancedVideos(vid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreAdvancedVideos(vid: vid, success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videoDicts = result["videos"]
                
                var videoDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videoDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videoDataSource.append(video)
                }
                self.videoDataSource.append(contentsOf: videoDataSource)
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func getRelatedVideos(vid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getRelatedVideos(vid: vid, success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let videoDicts = result["videos"]
                
                var videoDataSource: [DHVideoModel] = Array<DHVideoModel>()
                
                for videosDict in videoDicts as! [NSDictionary] {
                    let video: DHVideoModel = DHVideoModel(dictionary: videosDict)
                    videoDataSource.append(video)
                }
                self.videoDataSource.append(contentsOf: videoDataSource)
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
}
