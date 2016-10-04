//
//  DHVideoCellViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 10/5/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

let kVideoTableViewCellHeight: CGFloat = 80

class DHVideoCellViewModel: NSObject {

    var ykvid: String?
    var videolength: String?
    var vid: String?
    var title: String?
    var pulishin: String?
    var background: String?
    var date: String?
    
    init(videoModel: DHVideoModel?) {
        super.init()
        
        self.ykvid = videoModel?.ykvid
        self.videolength = videoModel?.videolength
        self.vid = videoModel?.vid
        self.title = videoModel?.title
        self.pulishin = videoModel?.pulishin
        self.background = videoModel?.background
        self.date = videoModel?.date
    }
    
}
