//
//  DHNewsDetailView.swift
//  Dota2Helper
//
//  Created by Shvier on 9/22/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import WebKit

class DHNewsDetailView: UIView {

    var webView: WKWebView?
    var webViewConfig: WKWebViewConfiguration?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        webViewConfig = WKWebViewConfiguration()
        webView = WKWebView(frame: frame, configuration: webViewConfig!)
        self.addSubview(webView!)
        self.backgroundColor = UIColor.blue
    }
    
    func bindDataWithViewModel(viewModel: DHNewsDetailViewModel) {
        let _ = webView?.load(viewModel.request!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
