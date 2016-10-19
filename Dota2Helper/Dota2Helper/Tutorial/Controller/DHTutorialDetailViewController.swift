//
//  DHTutorialDetailViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import WebKit

class DHTutorialDetailViewController: DHBaseDetailViewController, WKNavigationDelegate {

    var tutorialModel: DHTutorialModel?
    var dataController: DHTutorialDetailDataController?
    var tutorialDetailView: DHNewsDetailView?
    var loadingView: DHLoadingView?
    
// MARK: - 3D Touch Peek Menu
    @available(iOS 9.0, *)
    override var previewActionItems: [UIPreviewActionItem] {
        get {
            weak var weakSelf = self
            let openWithSafariAction: UIPreviewAction = UIPreviewAction(title: "使用Safari打开", style: .default, handler: { (UIPreviewAction, UIViewController) in
                if let strongSelf = weakSelf {
                    let request = strongSelf.dataController?.requestTutorialDetailDataUrlWithTutorialModel(tutorialModel: strongSelf.tutorialModel!)
                    UIApplication.shared.openURL((request?.url)!)
                }
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
        dataController = DHTutorialDetailDataController()
        let request: URLRequest = (dataController?.requestTutorialDetailDataUrlWithTutorialModel(tutorialModel: tutorialModel!))!
        let viewModel: DHNewsDetailViewModel = DHNewsDetailViewModel(request: request)
        tutorialDetailView = DHNewsDetailView(frame: CGRect(x: 0, y: 20, width: kNewsDetailViewWidth, height: kNewsDetailViewHeight))
        tutorialDetailView?.bindDataWithViewModel(viewModel: viewModel)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView?.isHidden = true
    }
    
    func setContentView() {
        tutorialDetailView?.webView?.navigationDelegate = self
        view.addSubview(tutorialDetailView!)
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
