//
//  DHStrategyDetailViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import WebKit

class DHStrategyDetailViewController: DHBaseDetailViewController, WKNavigationDelegate {

    lazy var viewModel: DHStrategyDetailViewModel = {
        return DHStrategyDetailViewModel()
    }()
    
    var strategyModel: DHStrategyModel?
    var strategyDetailView: DHStrategyDetailView?
    var loadingView: DHLoadingView?
    
// MARK: - 3D Touch Peek Menu
    @available(iOS 9.0, *)
    override var previewActionItems: [UIPreviewActionItem] {
        get {
            let openWithSafariAction: UIPreviewAction = UIPreviewAction(title: "使用Safari打开", style: .default, handler: { [unowned self] (UIPreviewAction, UIViewController) in
                self.viewModel.getDetailStrategy(model: self.strategyModel!, { (urlString) in
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
        strategyDetailView = DHStrategyDetailView(frame: CGRect(x: 0, y: 0, width: kStrategyDetailViewWidth, height: kStrategyDetailViewHeight))
        viewModel.getDetailStrategy(model: strategyModel!, { (urlString) in
            self.strategyDetailView?.loadRequest(request: URLRequest(url: URL(string: urlString)!))
        }, failure: {} ())
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView?.isHidden = true
    }
    
    func setContentView() {
        strategyDetailView?.webView?.navigationDelegate = self
        view.addSubview(strategyDetailView!)
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
