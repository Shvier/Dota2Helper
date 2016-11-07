//
//  DHNewsDetailViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/22/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import WebKit

class DHNewsDetailViewController: DHBaseDetailViewController, WKNavigationDelegate {

    var newsModel: DHNewsModel?
    var dataController: DHNewsDetailDataController?
    var newsDetailView: DHNewsDetailView?
    var loadingView: DHLoadingView?
    lazy var viewModel: DHNewsDetailViewModel = {
        return DHNewsDetailViewModel()
    }()

// MARK: - 3D Touch Peek Menu
    @available(iOS 9.0, *)
    override var previewActionItems: [UIPreviewActionItem] {
        get {
            let openWithSafariAction: UIPreviewAction = UIPreviewAction(title: "使用Safari打开", style: .default, handler: { [unowned self] (UIPreviewAction, UIViewController) in
                UIApplication.shared.openURL(URL(string: kGetNewsDetailUrl + self.newsModel!.date! + "/" + self.newsModel!.nid!)!)
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
        newsDetailView = DHNewsDetailView(frame: CGRect(x: 0, y: 0, width: kNewsDetailViewWidth, height: kNewsDetailViewHeight - kTabBarHeight))
        viewModel.getDetailNews(model: newsModel!, { [unowned self] in
            self.newsDetailView?.loadRequest(request: self.viewModel.request!)
        }())
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView?.isHidden = true
    }
    
    func setContentView() {
        newsDetailView?.webView?.navigationDelegate = self
        view.addSubview(newsDetailView!)
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
