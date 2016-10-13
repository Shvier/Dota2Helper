//
//  DHVideoPlayViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 10/9/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHVideoPlayViewController: UIViewController, YYMediaPlayerEvents {

    var ykvid: String?
    var player: YYMediaPlayer?
    var playerManager: YTEngineOpenViewManager?
    
    var dataController: DHVideoPlayDataController?
    var videoPlayeView: DHVideoPlayView?
    
    func initPlayer() {
        player = YYMediaPlayer()
        player?.controller = self
        player?.view().frame = view.frame
        player?.view().clipsToBounds = true
        player?.isFullscreen = false
        player?.platform = "youku"
        view.addSubview((player?.view())!)
        player?.addEventsObserver(self)
        player?.clientId = kYoukuClientId
        player?.clientSecret = kYoukuClientId
    }
    
    func initPlayerManager() {
        playerManager = YTEngineOpenViewManager(player: player)
        playerManager?.controllerFrame = view.bounds
        player?.addEventsObserver(playerManager)
    }
    
    func playVideo(vid: String) {
        player?.playVid(vid, quality: kYYVideoQualityHD2, password: nil, from: 0)
    }
    
    func handleVideoData() {
        dataController = DHVideoPlayDataController()
        dataController?.requestVideoDetailWithCallback(ykvid: ykvid!, callback: {
            self.renderPlayView()
        }())
    }
    
    func renderPlayView() {
        let request = dataController?.requestVideoDetailDataUrl()
        let viewModel: DHVideoPlayViewModel = DHVideoPlayViewModel(request: request!)
        DispatchQueue.main.async {
            self.videoPlayeView = DHVideoPlayView(frame: CGRect(x: 0, y: 0, width: kVideoPlayViewWidth, height: kVideoPlayViewHeight))
            self.videoPlayeView?.bindDataWithViewModel(viewModel: viewModel)
            self.view.addSubview(self.videoPlayeView!)
        }
    }
    
    func initLifeCycle() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initLifeCycle()
        handleVideoData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
