//
//  DHVideoPlayViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 10/9/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHVideoPlayViewController: UIViewController {

    var player: YYMediaPlayer?
    var playerManager: YTEngineOpenViewManager?
    
    func initPlayer() {
        player = YYMediaPlayer()
        player?.controller = self
        player?.view().frame = view.frame
        player?.view().clipsToBounds = true
        player?.isFullscreen = false
        player?.platform = "youku"
        view.addSubview((player?.view())!)
        player?.addEventsObserver(self)
        player?.clientId = "2f9d050663c87f13"
        player?.clientSecret = "bc01abf455c8c702f11eb7217344ce78"
    }
    
    func initPlayerManager() {
        playerManager = YTEngineOpenViewManager(player: player)
        playerManager?.controllerFrame = view.bounds
        player?.addEventsObserver(playerManager)
    }
    
    func playVideo(vid: String) {
        player?.playVid(vid, quality: kYYVideoQualityHD2, password: nil, from: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initPlayer()
        initPlayerManager()
        playVideo(vid: "269646652930")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
