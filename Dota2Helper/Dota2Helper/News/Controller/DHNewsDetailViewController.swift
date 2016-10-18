//
//  DHNewsDetailViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/22/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import WebKit

class DHNewsDetailViewController: DHBaseDetailViewController, WKNavigationDelegate, UIViewControllerPreviewingDelegate {

    var newsModel: DHNewsModel?
    var dataController: DHNewsDetailDataController?
    var newsDetailView: DHNewsDetailView?
    var loadingView: DHLoadingView?
    
    @available(iOS 9.0, *)
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
    }
    
    @available(iOS 9.0, *)
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
    }
    
    func handleData() {
        dataController = DHNewsDetailDataController()
        let request: URLRequest = (dataController?.requestNewsDetailDataUrlWithNewsModel(newsModel: newsModel!))!
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
