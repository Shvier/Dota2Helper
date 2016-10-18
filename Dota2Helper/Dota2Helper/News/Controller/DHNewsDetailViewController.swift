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

    @available(iOS 9.0, *)
    override var previewActionItems: [UIPreviewActionItem] {
        get {
            weak var weakSelf = self
            let openWithSafariAction: UIPreviewAction = UIPreviewAction(title: "使用Safari打开", style: .default, handler: { (UIPreviewAction, UIViewController) in
                let strongSelf = weakSelf
                let request = strongSelf?.dataController?.requestNewsDetailDataRequestWithNewsModel(newsModel: (strongSelf?.newsModel)!)
                UIApplication.shared.openURL((request?.url)!)
            })
            let cancelAction: UIPreviewAction = UIPreviewAction(title: "取消", style: .destructive, handler: { (UIPreviewAction, UIViewController) in
                
            })
            return [openWithSafariAction, cancelAction]
        }
        set {
            
        }
    }
    
    func handleData() {
        dataController = DHNewsDetailDataController()
        let request: URLRequest = (dataController?.requestNewsDetailDataRequestWithNewsModel(newsModel: newsModel!))!
        let viewModel: DHNewsDetailViewModel = DHNewsDetailViewModel(request: request)
        newsDetailView = DHNewsDetailView(frame: CGRect(x: 0, y: 20, width: kNewsDetailViewWidth, height: kNewsDetailViewHeight))
        newsDetailView?.bindDataWithViewModel(viewModel: viewModel)
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
