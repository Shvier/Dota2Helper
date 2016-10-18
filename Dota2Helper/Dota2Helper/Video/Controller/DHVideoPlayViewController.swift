//
//  DHVideoPlayViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 10/9/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import WebKit

class DHVideoPlayViewController: DHBaseDetailViewController, YYMediaPlayerEvents, WKNavigationDelegate {

    var ykvid: String?
    var player: YYMediaPlayer?
    var playerManager: YTEngineOpenViewManager?
    
    var dataController: DHVideoPlayDataController?
    var videoPlayView: DHVideoPlayView?
    var loadingView: DHLoadingView?
    
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
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView?.isHidden = true
    }
    
    func handleVideoData() {
        dataController = DHVideoPlayDataController()
        dataController?.requestVideoDetailWithCallback(ykvid: ykvid!, callback: {
            self.renderPlayView()
        }())
    }
    
    func renderPlayView() {
        let request = dataController?.requestVideoDetailDataUrl()
        weak var weakSelf = self
        let viewModel: DHVideoPlayViewModel = DHVideoPlayViewModel(request: request!)
        DispatchQueue.main.async {
            let strongSelf = weakSelf
            strongSelf?.videoPlayView = DHVideoPlayView(frame: CGRect(x: 0, y: 0, width: kVideoPlayViewWidth, height: kVideoPlayViewHeight))
            strongSelf?.videoPlayView?.bindDataWithViewModel(viewModel: viewModel)
            strongSelf?.view.addSubview(self.videoPlayView!)
            strongSelf?.setContentView()
        }
    }
    
    func setContentView() {
        videoPlayView?.webView?.navigationDelegate = self
        loadingView = addLoadingViewForViewController(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        handleVideoData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
