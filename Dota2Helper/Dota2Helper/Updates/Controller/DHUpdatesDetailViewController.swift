//
//  DHUpdatesDetailViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/26/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import WebKit

class DHUpdatesDetailViewController: DHBaseDetailViewController, WKNavigationDelegate {

    lazy var viewModel: DHUpdatesDetailViewModel = {
        return DHUpdatesDetailViewModel()
    }()
    
    var updateModel: DHUpdateModel?
    var updateDetailView: DHUpdateDetailView?
    var loadingView: DHLoadingView?
    
// MARK: - 3D Touch Peek Menu
    @available(iOS 9.0, *)
    override var previewActionItems: [UIPreviewActionItem] {
        get {
            let openWithSafariAction: UIPreviewAction = UIPreviewAction(title: "使用Safari打开", style: .default, handler: { [unowned self] (UIPreviewAction, UIViewController) in
                self.viewModel.getDetailUpdates(model: self.updateModel!, { (urlString) in
                    UIApplication.shared.openURL(URL(string: urlString)!)
                }, failure: {} ())
            })
            let cancelAction: UIPreviewAction = UIPreviewAction(title: "取消", style: .destructive, handler: { (UIPreviewAction, UIViewController) in
                
            })
            return [openWithSafariAction, cancelAction]
        }
        set {
            
        }
    }
    
// MARK: - Life Cycle
    func handleData() {
        updateDetailView = DHUpdateDetailView(frame: CGRect(x: 0, y: 0, width: kNewsDetailViewWidth, height: kNewsDetailViewHeight - kTabBarHeight))
        viewModel.getDetailUpdates(model: self.updateModel!, { [unowned self] (urlString) in
            self.updateDetailView?.loadRequest(request: URLRequest(url: URL(string: urlString)!))
        }, failure: {} ())
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView?.isHidden = true
    }
    
    func setContentView() {
        updateDetailView?.webView?.navigationDelegate = self
        view.addSubview(updateDetailView!)
        loadingView = addLoadingViewForViewController(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        handleData()
        setContentView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
