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
    
// MARK: - 3D Touch Peek Menu
    @available(iOS 9.0, *)
    override var previewActionItems: [UIPreviewActionItem] {
        get {
            weak var weakSelf = self
            let openWithSafariAction: UIPreviewAction = UIPreviewAction(title: "使用Safari打开", style: .default, handler: { (UIPreviewAction, UIViewController) in
                let strongSelf = weakSelf
                let request = strongSelf?.dataController?.requestJournalDetailDataWithJournalModel(journalModel: (strongSelf?.journalModel)!)
                UIApplication.shared.openURL((request?.url)!)
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
        dataController = DHJournalDetailDataController()
        let request: URLRequest = (dataController?.requestJournalDetailDataWithJournalModel(journalModel: journalModel!))!
        let viewModel: DHNewsDetailViewModel = DHNewsDetailViewModel(request: request)
        journalDetailView = DHJournalDetailView(frame: CGRect(x: 0, y: 0, width: kNewsDetailViewWidth, height: kNewsDetailViewHeight - kTabBarHeight))
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
