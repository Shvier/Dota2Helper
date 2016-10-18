//
//  DHJournalDetailViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/26/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import WebKit

class DHJournalDetailViewController: DHBaseDetailViewController, WKNavigationDelegate {

    var journalModel: DHJournalModel?
    var dataController: DHJournalDetailDataController?
    var journalDetailView: DHJournalDetailView?
    var loadingView: DHLoadingView?
    
    func handleData() {
        dataController = DHJournalDetailDataController()
        let request: URLRequest = (dataController?.requestJournalDetailDataWithJournalModel(journalModel: journalModel!))!
        let viewModel: DHNewsDetailViewModel = DHNewsDetailViewModel(request: request)
        journalDetailView = DHJournalDetailView(frame: CGRect(x: 0, y: 20, width: kNewsDetailViewWidth, height: kNewsDetailViewHeight))
        journalDetailView?.bindDataWithViewModel(viewModel: viewModel)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView?.isHidden = true
    }
    
    func setContentView() {
        journalDetailView?.webView?.navigationDelegate = self
        view.addSubview(journalDetailView!)
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
