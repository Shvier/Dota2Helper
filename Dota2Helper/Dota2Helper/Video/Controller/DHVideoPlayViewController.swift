//
//  DHVideoPlayViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 10/9/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import WebKit

class DHVideoPlayViewController: DHBaseDetailViewController {
    
    var player: YYMediaPlayer?
    var playerManager: YTEngineOpenViewManager?
    var ykvid: String?
    var dataController: DHVideoPlayDataController?
    var loadingView: DHLoadingView?
    
    lazy var videoPlayView: DHVideoPlayView = {
        return DHVideoPlayView(frame: CGRect(x: 0, y: 0, width: kVideoPlayViewWidth, height: kVideoPlayViewHeight))
    }()
    
// MARK: - Data Handler and View Renderer
    func handleVideoData() {
        dataController = DHVideoPlayDataController()
        dataController?.requestVideoDetailWithCallback(ykvid: ykvid!, callback: {
            self.renderPlayView()
        }())
    }
    
    func renderPlayView() {
        let request = dataController?.requestVideoDetailDataUrl()
        let viewModel: DHVideoPlayViewModel = DHVideoPlayViewModel(request: request!)
        DispatchQueue.main.async { [unowned self] in
            self.videoPlayView.bindDataWithViewModel(viewModel: viewModel)
            self.view.addSubview(self.videoPlayView)
            self.setContentView()
        }
    }
    
    func setContentView() {
        videoPlayView.webView?.navigationDelegate = self
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

// MARK: - WKNavigationDelegate
extension DHVideoPlayViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView?.isHidden = true
    }
}

// MARK: - F**king Youku SDK.PS: Needs tests
extension DHVideoPlayViewController: YYMediaPlayerEvents {
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
}
