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
    
    func getAllVideos(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getAllVideos(success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func getJieshuoVideos(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getJieshuoVideos(success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func getBisaiVideos(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getBisaiVideos(success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func getCelebrityVideos(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getCelebrityVideos(success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func getQuweiVideos(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getQuweiVideos(success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func getBeginnerVideos(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getBeginnerVideos(success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func getAdvancedVideos(success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getAdvancedVideos(success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func loadMoreAllVideos(vid: String, success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreAllVideos(vid: vid, success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func loadMoreJieshuoVideos(vid: String, success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreJieshuoVideos(vid: vid, success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func loadMoreBisaiVideos(vid: String, success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreBisaiVideos(vid: vid, success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func loadMoreCelebrityVideos(vid: String, success: @escaping(_ repsonse: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreCelebrityVideos(vid: vid, success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func loadMoreQuweiVideos(vid: String, success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreQuweiVideos(vid: vid, success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func loadMoreBeginnerVideos(vid: String, success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreBeginnerVideos(vid: vid, success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func loadMoreAdvancedVideos(vid: String, success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreAdvancedVideos(vid: vid, success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func getRelatedVideos(vid: String, success: @escaping(_ response: Data) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getRelatedVideos(vid: vid, success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
}
